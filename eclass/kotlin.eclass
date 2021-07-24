# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: kotlin.eclass
# @MAINTAINER:
# Yuan Liao <liaoyuan@gmail.com>
# @AUTHOR:
# Yuan Liao <liaoyuan@gmail.com>
# @SUPPORTED_EAPIS: 6 7
# @BLURB: The eclass for Kotlin packages
# @DESCRIPTION:
# This eclass can be inherited by ebuilds for a Kotlin package to select a
# Kotlin compiler version required by the package and compile the package's
# sources.

case "${EAPI:-0}" in
	6|7) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

EXPORT_FUNCTIONS pkg_setup src_compile src_install

# Allow use of EAPI 7 version manipulators in older EAPIs for both this eclass
# and consumer ebuilds
[[ "${EAPI:-0}" -eq 6 ]] && inherit eapi7-ver

# @ECLASS-VARIABLE: KOTLIN_VERSIONS
# @DEFAULT_UNSET
# @PRE_INHERIT
# @DESCRIPTION:
# An array of the feature release versions (e.g. 1.4, 1.5) of Kotlin compilers
# that can be used to build this package. An open interval of versions can also
# be specified with a string that starts with either ">=" or "<" operator.
# Default is unset, which signifies that any feature release can be used, and
# can be overriden from ebuild BEFORE inheriting this class.
#
# If an array of versions is specified, then the version of the compiler that
# will be used is determined with the following rules, in order:
# 1. Any versions that have a compiler already installed on the system will
#    take precedence over the versions that are not installed yet.
# 2. When there is a tie, the version appeared earlier in the array will be
#    used.
#
# Examples:
# @CODE
# # Define a single version
# KOTLIN_VERSIONS=( 1.5 )
# # Define a closed range, preferring newer versions
# KOTLIN_VERSIONS=( 1.{5..3} )
# # Define an open range with a lower bound
# KOTLIN_VERSIONS=">=1.3"
# # Define an open range with an upper bound
# KOTLIN_VERSIONS="<1.6"
# @CODE

# @ECLASS-VARIABLE: KOTLIN_COMPILER_HOME
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# The path to the Kotlin compiler installation that will be used for building
# this package. Will be set by this ebuild and be available after the pkg_setup
# phase.

inherit kotlin-utils

if [[ -z "${KOTLIN_VERSIONS}" ]]; then
	_KOTLIN_DEPEND="virtual/kotlin:*"
elif [[ "${KOTLIN_VERSIONS}" == ">="* ]]; then
	_KOTLIN_DEPEND=">=virtual/kotlin-${KOTLIN_VERSIONS/>=}:*"
elif [[ "${KOTLIN_VERSIONS}" == "<"* ]]; then
	_KOTLIN_DEPEND="<virtual/kotlin-${KOTLIN_VERSIONS/<}:*"
else
	_KOTLIN_DEPEND="|| ("
	for slot in "${KOTLIN_VERSIONS[@]}"; do
		_KOTLIN_DEPEND+=" virtual/kotlin:${slot} "
	done
	_KOTLIN_DEPEND+=")"
fi
DEPEND="${_KOTLIN_DEPEND}"
unset _KOTLIN_DEPEND

# @FUNCTION: _kotlin_get_compiler_ver
# @INTERNAL
# @USAGE: <package>
# @DESCRIPTION:
# Echos the feature release version of a Kotlin compiler package. This function
# should be called only in pkg_* phases.
_kotlin_get_compiler_ver() {
	debug-print-function ${FUNCNAME} "$@"
	[[ $# -eq 1 ]] || die "Exactly one argument is needed for ${FUNCNAME}"
	local pkg_desc_root="${EROOT}/usr/share/eselect-kotlin/pkgs"
	local pkg_desc="$(find "${pkg_desc_root}" -type f -name "$1")"
	basename "$(dirname "${pkg_desc}")"
}

# @FUNCTION: _kotlin_get_compiler_home
# @INTERNAL
# @DESCRIPTION:
# Echos the path to the Kotlin compiler installation that will be used for
# building this package. This function should be called only in pkg_* phases.
_kotlin_get_compiler_home() {
	local prefs_root="${EROOT}/etc/eselect/kotlin/homes"
	local ver

	if [[ -z "${KOTLIN_VERSIONS}" ]]; then
		ver="system"
	elif ! [[ "${KOTLIN_VERSIONS}" == ">="* ||
		"${KOTLIN_VERSIONS}" == "<"* ]]; then
		for slot in "${KOTLIN_VERSIONS[@]}"; do
			local symlink="${prefs_root}/${slot}"
			if [[ -L "${symlink}" && -d "${symlink}" ]]; then
				ver="${slot}"
			fi
		done
	else
		local bound op
		if [[ "${KOTLIN_VERSIONS}" == ">="* ]]; then
			bound="${KOTLIN_VERSIONS/>=}"
			op="-ge"
		else
			bound="${KOTLIN_VERSIONS/<}"
			op="-lt"
		fi

		local system_symlink="${prefs_root}/system"
		local system_pkg="$(basename "$(readlink "${system_symlink}")")"
		local system_ver="$(_kotlin_get_compiler_ver "${system_pkg}")"

		if ver_test "${system_ver}" "${op}" "${bound}"; then
			ver="system"
		else
			for slot in $(find "${prefs_root}" -type l -name "*.*" -exec \
				basename {} \; | sort -rV); do
				if ver_test "${slot}" "${op}" "${bound}"; then
					ver="${slot}"
					break
				fi
			done
		fi
	fi

	[[ -n "${ver}" ]] || die \
		"Could not find a Kotlin compiler whose version meets the requirement"

	readlink "${prefs_root}/${ver}"
}

# @FUNCTION: kotlin_pkg_setup
# @DESCRIPTION:
# Selects the Kotlin compiler to be used for building this package.
kotlin_pkg_setup() {
	java-pkg-2_pkg_setup
	KOTLIN_COMPILER_HOME="$(_kotlin_get_compiler_home)"
	readonly KOTLIN_COMPILER_HOME
	local compiler_pkg="$(basename "${KOTLIN_COMPILER_HOME}")"
	einfo "Using Kotlin compiler package: ${compiler_pkg}"
	export GENTOO_KOTLIN_VER="$(_kotlin_get_compiler_ver "${compiler_pkg}")"
}

# @FUNCTION: kotlin_src_compile
# @DESCRIPTION:
# Compiles the source files in KOTLIN_SRC_DIR using compiler arguments
# specified by other variables of this eclass, with classpath calculated from
# JAVA_GENTOO_CLASSPATH, and packages the resulting classes as a JAR to
# JAVA_JAR_FILENAME. If the file ${KOTLIN_UTILS_CLASSES}/META-INF/MANIFEST.MF
# exists, it will be used as the manifest of the created JAR.
kotlin_src_compile() {
	kotlin-utils_src_compile
	kotlin-utils_jar
}

# @FUNCTION: kotlin_src_install
# @DESCRIPTION:
# Installs the JAR specified by JAVA_JAR_FILENAME, and a launcher as well if
# JAVA_MAIN_CLASS is set.
kotlin_src_install() {
	java-pkg_dojar "${JAVA_JAR_FILENAME}"

	if [[ -n "${JAVA_MAIN_CLASS}" ]]; then
		java-pkg_dolauncher "${JAVA_LAUNCHER_FILENAME}" \
			--main "${JAVA_MAIN_CLASS}"
	fi
}
