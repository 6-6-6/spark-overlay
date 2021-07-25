# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: kotlin-utils.eclass
# @MAINTAINER:
# Yuan Liao <liaoyuan@gmail.com>
# @AUTHOR:
# Yuan Liao <liaoyuan@gmail.com>
# @SUPPORTED_EAPIS: 6 7
# @BLURB: An utility eclass for building Kotlin packages
# @DESCRIPTION:
# This eclass provides functionalities for compiling Kotlin sources, which is
# used by kotlin.eclass, kotlin-libs.eclass and kotlin-core-deps.eclass, as
# well as ebuilds for a Kotlin package. It inherits java-pkg-simple.eclass and
# recognizes variables declared by that eclass when appropriate.
#
# This eclass should not be inherited directly from an ebuild. Instead, please
# use one of the eclasses that are based on this eclass. For normal Kotlin
# packages, please use kotlin.eclass. kotlin-libs.eclass and
# kotlin-core-deps.eclass are used by the Kotlin core library packages and
# should not be used by ebuilds for normal Kotlin packages.

case "${EAPI:-0}" in
	6|7) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

if [[ ! "${_KOTLIN_UTILS_INHERITED}" ]]; then

# Kotlin compiler options

# @ECLASS-VARIABLE: KOTLIN_SRC_DIR
# @DEFAULT_UNSET
# @DESCRIPTION:
# An array of directories relative to ${S} which contain the Kotlin sources to
# compile for the ebuild. A string with directories separated by white space
# works as well. Default is unset, which will cause all source files inside
# ${S} to be compiled, and can be overridden from ebuild anywhere.

# @ECLASS-VARIABLE: KOTLIN_MODULE_NAME
# @DESCRIPTION:
# The argument to kotlinc's -module-name option. Defaults to ${PN}, can be
# overridden from ebuild anywhere.
: ${KOTLIN_MODULE_NAME:="${PN}"}

# @ECLASS-VARIABLE: KOTLIN_COMMON_SOURCES_DIR
# @DEFAULT_UNSET
# @DESCRIPTION:
# An array of directories relative to ${S} which contains the sources to pass
# to kotlinc's -Xcommon-sources option. Default is unset, can be overridden
# from ebuild anywhere.

# @ECLASS-VARIABLE: KOTLIN_KOTLINC_ARGS
# @DEFAULT_UNSET
# @DESCRIPTION:
# An array of any extra arguments to kotlinc that will added after all other
# arguments set by the variables of this eclass and before the list of Kotlin
# source files. Default is unset, can be overridden from ebuild anywhere.

# @ECLASS-VARIABLE: KOTLIN_KOTLINC_JAVA_OPTS
# @DEFAULT_UNSET
# @DESCRIPTION:
# Any options for the JVM instances started by kotlinc. Default is unset, can
# be overridden from ebuild anywhere.

# Java compiler options for Kotlin packages that have Java code

# @ECLASS-VARIABLE: KOTLIN_JAVA_SOURCE_ROOTS
# @DEFAULT_UNSET
# @DESCRIPTION:
# An array of the arguments to kotlinc's -Xjava-source-roots option. This
# eclass will concatenate each element in the array into a single string, using
# a comma to separate each pair of adjacent elements, and pass the string as
# the option's value to kotlinc. All Java sources in the specified directory
# will be compiled after the Kotlin sources. Default is unset, can be
# overridden from ebuild anywhere.

# @ECLASS-VARIABLE: KOTLIN_JAVA_WANT_SOURCE_TARGET
# @DEFAULT_UNSET
# @DESCRIPTION:
# The argument to javac's -source and -target options. Default is unset, can be
# overridden from ebuild anywhere.

# @ECLASS-VARIABLE: KOTLIN_JAVAC_ARGS
# @DEFAULT_UNSET
# @DESCRIPTION:
# An array of any extra arguments to javac that will added after all other
# arguments set by the variables of this eclass and before the list of Java
# source files. Default is unset, can be overridden from ebuild anywhere.

# Kotlin version

# @ECLASS-VARIABLE: KOTLIN_VERSIONS
# @DEFAULT_UNSET
# @PRE_INHERIT
# @DESCRIPTION:
# The feature release versions (e.g. 1.4, 1.5) of Kotlin compilers that can be
# used to build this package. This variable's value should be a string that
# starts with one of the "=", ">=" and "<" operators followed by a feature
# release number. Default is unset, which signifies that any feature release
# can be used.  Although kotlin-utils.eclass does not require this variable to
# be set before it is inherited, other eclasses that inherit this eclass, like
# kotlin.eclass and kotlin-libs.eclass, may require it to be set before they
# are inherited.
#
# Examples:
# @CODE
# # Define a single version
# KOTLIN_VERSIONS="=1.5"
# # Define an open range with a lower bound
# KOTLIN_VERSIONS=">=1.4"
# # Define an open range with an upper bound
# KOTLIN_VERSIONS="<1.6"
# @CODE

# @ECLASS-VARIABLE: KOTLIN_VERSIONS_PREF_ORDER
# @DEFAULT_UNSET
# @DESCRIPTION:
# An array of Kotlin feature release versions defining an order of preference
# on them. Kotlin eclasses may use the first version in this array that meets
# the feature release requirement specified by KOTLIN_VERSIONS and is installed
# on the system to build this package. Any elements that do not satisfy the
# requirement of KOTLIN_VERSIONS will be ignored. If all elements are ignored
# due to this, then the system compiler set by 'eselect kotlin set system' will
# be used first if it matches KOTLIN_VERSIONS; otherwise, the highest installed
# version matching KOTLIN_VERSIONS will be used. Default is unset, which
# exhibits the same behavior as if all elements are ignored, and can be
# overridden from ebuild BEFORE the pkg_setup phase.

# @ECLASS-VARIABLE: KOTLIN_REQ_USE
# @DEFAULT_UNSET
# @PRE_INHERIT
# @DESCRIPTION:
# The USE dependency specification required for any Kotlin compiler version
# selected for building this package. Default is unset, can be overridden from
# ebuild BEFORE inheriting this eclass.

# @ECLASS-VARIABLE: KOTLIN_WANT_TARGET
# @DEFAULT_UNSET
# @DESCRIPTION:
# The argument to kotlinc's -api-version and -language-version options.
# Default is unset, can be overridden from ebuild anywhere. It is the ebuild
# itself's responsibility to make sure the target version is supported by any
# Kotlin compiler version that will ever be used to build this package.

# Read-only variables

# @ECLASS-VARIABLE: KOTLIN_UTILS_CLASSES
# @DESCRIPTION:
# The directory where compiled classes will be stored relative to ${S}.
KOTLIN_UTILS_CLASSES="target/classes"
readonly KOTLIN_UTILS_CLASSES

# @ECLASS-VARIABLE: KOTLIN_UTILS_REQ_USE
# @DESCRIPTION:
# An empty string if KOTLIN_REQ_USE is unset, or "[${KOTLIN_REQ_USE}]" if it is
# set.
if [[ -n "${KOTLIN_REQ_USE}" ]]; then
	KOTLIN_UTILS_REQ_USE="[${KOTLIN_REQ_USE}]"
fi
readonly KOTLIN_UTILS_REQ_USE

# @ECLASS-VARIABLE: KOTLIN_COMPILER_HOME
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# The path to the Kotlin compiler installation that will be used for building
# this package. Will be set by this eclass and be available after the
# kotlin-utils_pkg_setup function is called.

inherit java-pkg-2 java-pkg-simple

# @FUNCTION: kotlin-utils_set_kotlin_depend
# @DESCRIPTION:
# Adds a dependency specification that enforces the requirement of
# KOTLIN_VERSIONS to the DEPEND variable.
kotlin-utils_set_kotlin_depend() {
	if [[ "${KOTLIN_VERSIONS}" == "="* ]]; then
		DEPEND+=" virtual/kotlin:${KOTLIN_VERSIONS/=}${KOTLIN_UTILS_REQ_USE}"
	elif [[ "${KOTLIN_VERSIONS}" == ">="* ]]; then
		DEPEND+=" >=virtual/kotlin-${KOTLIN_VERSIONS/>=}:*${KOTLIN_UTILS_REQ_USE}"
	elif [[ "${KOTLIN_VERSIONS}" == "<"* ]]; then
		DEPEND+=" <virtual/kotlin-${KOTLIN_VERSIONS/<}:*${KOTLIN_UTILS_REQ_USE}"
	else
		DEPEND+=" virtual/kotlin:*${KOTLIN_UTILS_REQ_USE}"
	fi
}

# @FUNCTION: _kotlin-utils_get_compiler_ver
# @INTERNAL
# @USAGE: <package>
# @DESCRIPTION:
# Echos the feature release version of a Kotlin compiler package. This function
# should be called only in pkg_* phases.
_kotlin-utils_get_compiler_ver() {
	debug-print-function ${FUNCNAME} "$@"
	[[ $# -eq 1 ]] || die "Exactly one argument is needed for ${FUNCNAME}"
	local pkg_desc_root="${EROOT}/usr/share/eselect-kotlin/pkgs"
	local pkg_desc="$(find "${pkg_desc_root}" -type f -name "$1")"
	basename "$(dirname "${pkg_desc}")"
}

# @FUNCTION: _kotlin-utils_get_compiler_home
# @INTERNAL
# @DESCRIPTION:
# Echos the path to the Kotlin compiler installation that will be used for
# building this package. This function should be called only in pkg_* phases.
_kotlin-utils_get_compiler_home() {
	local prefs_root="${EROOT}/etc/eselect/kotlin/homes"
	local ver

	if [[ -z "${KOTLIN_VERSIONS}" ]]; then
		ver="system"
	elif [[ "${KOTLIN_VERSIONS}" == "="* ]]; then
		local slot="${KOTLIN_VERSIONS/=}"
		local symlink="${prefs_root}/${slot}"
		if [[ -L "${symlink}" && -d "${symlink}" ]]; then
			ver="${slot}"
		fi
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
		local system_ver="$(_kotlin-utils_get_compiler_ver "${system_pkg}")"

		if [[ -n "${KOTLIN_VERSIONS_PREF_ORDER}" ]]; then
			for slot in "${KOTLIN_VERSIONS_PREF_ORDER[@]}"; do
				if ver_test "${slot}" "${op}" "${bound}"; then
					ver="${slot}"
					break
				fi
			done
		fi
		# All preferred versions have been tried
		if [[ -z "${ver}" ]]; then
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
	fi

	[[ -n "${ver}" ]] || die \
		"Could not find a Kotlin compiler whose version meets the requirement"

	readlink "${prefs_root}/${ver}"
}

# @FUNCTION: kotlin-utils_pkg_setup
# @DESCRIPTION:
# Selects the Kotlin compiler to be used for building this package, then sets
# KOTLIN_COMPILER_HOME to the compiler's installation path and prints the
# package's name.
kotlin-utils_pkg_setup() {
	KOTLIN_COMPILER_HOME="$(_kotlin-utils_get_compiler_home)"
	readonly KOTLIN_COMPILER_HOME
	local compiler_pkg="$(basename "${KOTLIN_COMPILER_HOME}")"
	einfo "Using Kotlin compiler package: ${compiler_pkg}"
	export GENTOO_KOTLIN_VER="$(_kotlin-utils_get_compiler_ver \
		"${compiler_pkg}")"
}

# @FUNCTION: kotlin-utils_kotlinc
# @USAGE: <kotlinc_arguments>
# @DESCRIPTION:
# Invokes the Kotlin compiler with arguments specified by the eclass variables,
# followed by <kotlinc_arguments>.
kotlin-utils_kotlinc() {
	debug-print-function ${FUNCNAME} "$@"

	local compiler_executable
	compiler_executable="kotlinc"

	# Prepare arguments whose values should be separated by comma
	local OLD_IFS="${IFS}"
	if [[ -n "${KOTLIN_COMMON_SOURCES_DIR}" ]]; then
		local common_sources_files=(
			$(find "${KOTLIN_COMMON_SOURCES_DIR[@]}" -name "*.kt")
		)
		IFS=','
		local common_sources="-Xcommon-sources=${common_sources_files[*]}"
	fi
	IFS=','
	local java_source_roots="${KOTLIN_JAVA_SOURCE_ROOTS:+-Xjava-source-roots=${KOTLIN_JAVA_SOURCE_ROOTS[*]}}"
	IFS="${OLD_IFS}"

	local compiler_command_args=(
		"${compiler_executable}"
		"${KOTLIN_WANT_TARGET:+-api-version ${KOTLIN_WANT_TARGET}}"
		"${KOTLIN_WANT_TARGET:+-language-version ${KOTLIN_WANT_TARGET}}"
		"${KOTLIN_MODULE_NAME:+-module-name ${KOTLIN_MODULE_NAME}}"
		"${common_sources}"
		"${java_source_roots}"
		"${KOTLIN_KOTLINC_ARGS[@]}"
		"$@"
	)
	local compiler_command="${compiler_command_args[@]}"

	if [[ -n ${JAVA_PKG_DEBUG} ]]; then
		einfo "Verbose logging for \"${FUNCNAME}\" function"
		einfo "JAVA_OPTS: ${KOTLIN_KOTLINC_JAVA_OPTS}"
		einfo "Compiler arguments:"
		einfo "${compiler_command}"
	fi

	ebegin "Compiling"
	JAVA_OPTS="${KOTLIN_KOTLINC_JAVA_OPTS}" ${compiler_command} || \
		die "${FUNCNAME} failed"
}

# @FUNCTION: kotlin-utils_src_compile
# @DESCRIPTION:
# Compiles the source files in KOTLIN_SRC_DIR using compiler arguments
# specified by other variables of this eclass, with classpath calculated from
# JAVA_GENTOO_CLASSPATH.  Note that this function does not generate the JAR.
kotlin-utils_src_compile() {
	java-pkg_gen-cp JAVA_GENTOO_CLASSPATH

	# Create the target directory
	mkdir -p "${KOTLIN_UTILS_CLASSES}" || \
		die "Could not create the target directory for compiled classes"

	# Compute classpath
	local classpath=""
	java-pkg-simple_getclasspath

	java-pkg-simple_prepend_resources \
		"${KOTLIN_UTILS_CLASSES}" "${JAVA_RESOURCE_DIRS[@]}"

	# Compile Kotlin source files
	local kotlin_sources="kotlin_sources.lst"
	find "${KOTLIN_SRC_DIR[@]}" -name "*.kt" > "${kotlin_sources}"
	kotlin-utils_kotlinc \
		-d "${KOTLIN_UTILS_CLASSES}" \
		${classpath:+-classpath ${classpath}} \
		"@${kotlin_sources}"
	# Compile any Java source files after the Kotlin sources because
	# the Java sources require the Kotlin classes as dependencies
	if [[ -n "${KOTLIN_JAVA_SOURCE_ROOTS[@]}" ]]; then
		local java_sources="java_sources.lst"
		local java_classpath="${classpath:+${classpath}:}${KOTLIN_UTILS_CLASSES}"
		find "${KOTLIN_JAVA_SOURCE_ROOTS[@]}" -name "*.java" > "${java_sources}"
		ebegin "Compiling Java sources"
		$(java-pkg_get-javac) \
			-d "${KOTLIN_UTILS_CLASSES}" \
			-classpath ${java_classpath} \
			-encoding "${JAVA_ENCODING}" \
			${KOTLIN_JAVA_WANT_SOURCE_TARGET:+-source ${KOTLIN_JAVA_WANT_SOURCE_TARGET}} \
			${KOTLIN_JAVA_WANT_SOURCE_TARGET:+-target ${KOTLIN_JAVA_WANT_SOURCE_TARGET}} \
			"${KOTLIN_JAVAC_ARGS[@]}" \
			"@${java_sources}" || die "Failed to compile Java sources"
	fi
}

# @FUNCTION: kotlin-utils_jar
# @DESCRIPTION:
# Creates a JAR from the files generated during compilation at
# JAVA_JAR_FILENAME. If the file ${KOTLIN_UTILS_CLASSES}/META-INF/MANIFEST.MF
# exists, it will be used as the manifest of the created JAR.
kotlin-utils_jar() {
	[[ -d "${KOTLIN_UTILS_CLASSES}" ]] || \
		die "Cannot create JAR before any sources are compiled"
	local jar_args
	if [[ -e "${KOTLIN_UTILS_CLASSES}/META-INF/MANIFEST.MF" ]]; then
		jar_args="cfm ${JAVA_JAR_FILENAME} ${KOTLIN_UTILS_CLASSES}/META-INF/MANIFEST.MF"
	elif [[ -n "${JAVA_MAIN_CLASS}" ]]; then
		jar_args="cfe ${JAVA_JAR_FILENAME} ${JAVA_MAIN_CLASS}"
	else
		jar_args="cf ${JAVA_JAR_FILENAME}"
	fi
	jar ${jar_args} -C "${KOTLIN_UTILS_CLASSES}" . || die "Failed to create JAR"
}

_KOTLIN_UTILS_INHERITED=1
fi
