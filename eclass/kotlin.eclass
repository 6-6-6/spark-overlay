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

# @FUNCTION: kotlin_pkg_setup
# @DESCRIPTION:
# Selects the Kotlin compiler to be used for building this package.
kotlin_pkg_setup() {
	java-pkg-2_pkg_setup
	kotlin-utils_pkg_setup
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
