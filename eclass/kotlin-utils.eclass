# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: kotlin-utils.eclass
# @MAINTAINER:
# Yuan Liao <liaoyuan@gmail.com>
# @AUTHOR:
# Yuan Liao <liaoyuan@gmail.com>
# @SUPPORTED_EAPIS: 6 7 8
# @PROVIDES: java-pkg-2 java-pkg-simple
# @BLURB: An utility eclass for building Kotlin packages
# @DESCRIPTION:
# This eclass provides functionalities for compiling Kotlin sources, which is
# used by kotlin.eclass, kotlin-libs.eclass and kotlin-core-deps.eclass, as
# well as ebuilds for a Kotlin package. It inherits java-pkg-simple.eclass and
# recognizes variables declared by that eclass when appropriate.
#
# This eclass does not export any phase functions, and its only changes to
# ebuild metadata variables are to append USE_EXPAND flags for choosing the
# Kotlin compiler version to IUSE and to set a restriction on those USE_EXPAND
# flags in REQUIRED_USE, so it can be inherited safely. However, ebuilds for
# pure Kotlin packages should inherit kotlin.eclass, which exports various
# phase functions that automatically call functions in this eclass and is thus
# more convenient to use.
#
# For more information about creating a Kotlin package using this eclass,
# please consult the Kotlin Package Maintainer Guide:
# https://wiki.gentoo.org/wiki/Kotlin/Package_Maintainer_Guide

case "${EAPI:-0}" in
	6|7|8) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

# Allow use of EAPI 7 version manipulators in older EAPIs for both this eclass
# and consumer ebuilds
[[ "${EAPI:-0}" -eq 6 ]] && inherit eapi7-ver

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
# An array of directories relative to ${S} which contain the sources to pass to
# kotlinc's -Xcommon-sources option. Default is unset, can be overridden from
# ebuild anywhere.

# @ECLASS-VARIABLE: KOTLIN_KOTLINC_ARGS
# @DEFAULT_UNSET
# @DESCRIPTION:
# An array of any extra arguments to kotlinc that will be added after all other
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

# @ECLASS-VARIABLE: KOTLIN_SKIP_COMPILER_SETUP
# @DEFAULT_UNSET
# @DESCRIPTION:
# If a non-empty value is set, a Kotlin compiler will not be set up in
# kotlin-utils_pkg_setup. Setting a non-empty value allows
# kotlin-utils_pkg_setup to be called when there are no Kotlin compilers
# installed on the system, but the behaviors of any functions that may invoke
# the Kotlin compiler and the values of any variables storing information about
# the Kotlin compiler used to build the package are unspecified. Useful for
# packages that do not need the Kotlin compiler to build. Default is unset, can
# be overridden from ebuild BEFORE calling kotlin-utils_pkg_setup.

# Test options

# @ECLASS-VARIABLE: KOTLIN_TESTING_FRAMEWORKS
# @DEFAULT_UNSET
# @PRE_INHERIT
# @DESCRIPTION:
# A space-separated list that defines the testing frameworks for tests that
# should be run in the src_test phase. Default is unset. Although
# kotlin-utils.eclass does not require this variable to be set before it is
# inherited, other eclasses that inherit this eclass, like kotlin.eclass and
# kotlin-libs.eclass, may require it to be set before they are inherited.
#
# The supported testing frameworks are:
# - pkgdiff: Compare JAVA_JAR_FILENAME with JAVA_BINJAR_FILENAME
# - junit-4: Run tests with JUnit 4

# @ECLASS-VARIABLE: KOTLIN_TEST_SRC_DIR
# @DEFAULT_UNSET
# @DESCRIPTION:
# The counterpart of KOTLIN_SRC_DIR during the src_test phase. Default is
# unset, which will cause test sources compilation to be skipped, and can be
# overridden from ebuild anywhere.

# @ECLASS-VARIABLE: KOTLIN_TEST_COMMON_SOURCES_DIR
# @DEFAULT_UNSET
# @DESCRIPTION:
# The counterpart of KOTLIN_COMMON_SOURCES_DIR during the src_test phase.
# Default is unset, can be overridden from ebuild anywhere.

# @ECLASS-VARIABLE: KOTLIN_TEST_KOTLINC_ARGS
# @DEFAULT_UNSET
# @DESCRIPTION:
# The counterpart of KOTLIN_KOTLINC_ARGS during the src_test phase. Default is
# unset, can be overridden from ebuild anywhere.

# @ECLASS-VARIABLE: KOTLIN_TEST_KOTLINC_JAVA_OPTS
# @DEFAULT_UNSET
# @DESCRIPTION:
# The counterpart of KOTLIN_KOTLINC_JAVA_OPTS during the src_test phase.
# Default is unset, can be overridden from ebuild anywhere.

# @ECLASS-VARIABLE: KOTLIN_TEST_JAVA_SOURCE_ROOTS
# @DEFAULT_UNSET
# @DESCRIPTION:
# The counterpart of KOTLIN_JAVA_SOURCE_ROOTS during the src_test phase.
# Default is unset, can be overridden from ebuild anywhere.

# @ECLASS-VARIABLE: KOTLIN_TEST_JAVA_WANT_SOURCE_TARGET
# @DEFAULT_UNSET
# @DESCRIPTION:
# The counterpart of KOTLIN_JAVA_WANT_SOURCE_TARGET during the src_test phase.
# Default is unset, can be overridden from ebuild anywhere.

# @ECLASS-VARIABLE: KOTLIN_TEST_JAVAC_ARGS
# @DEFAULT_UNSET
# @DESCRIPTION:
# The counterpart of KOTLIN_JAVAC_ARGS during the src_test phase. Default is
# unset, can be overridden from ebuild anywhere.

# @ECLASS-VARIABLE: KOTLIN_TEST_EXCLUDES
# @DEFAULT_UNSET
# @DESCRIPTION:
# An array of classes that should not be executed during the src_test phase.
# Default is unset, can be overridden from ebuild anywhere.

# @ECLASS-VARIABLE: KOTLIN_TEST_RUN_ONLY
# @DEFAULT_UNSET
# @DESCRIPTION:
# An array of classes that should be exclusively executed during the src_test
# phase. This variable takes precedence over KOTLIN_TEST_EXCLUDES. Default is
# unset, can be overridden from ebuild anywhere.

# Kotlin version

# @ECLASS-VARIABLE: KOTLIN_COMPAT
# @DEFAULT_UNSET
# @PRE_INHERIT
# @REQUIRED
# @DESCRIPTION:
# An array of feature release versions (e.g. 1.4, 1.5) of Kotlin compilers that
# can be used to build this package. The identifier for version 1.x is
# "kotlin1-x". Default is unset, must be overridden from ebuild or eclass
# BEFORE inheriting this eclass.
#
# Example:
# @CODE
# KOTLIN_COMPAT=( kotlin1-4 kotlin1-5 )
# # Bash brace expansion may be used
# KOTLIN_COMPAT=( kotlin1-{4..5} )
# @CODE

# @ECLASS-VARIABLE: KOTLIN_COMPAT_OVERRIDE
# @DEFAULT_UNSET
# @USER_VARIABLE
# @DESCRIPTION:
# An identifier for a Kotlin feature release version ("kotlin1-x" for Kotlin
# 1.x) that can be used during ebuild development to force use of a particular
# Kotlin feature release. Default is unset, can be overridden via make.conf(5),
# environment variable with the same name, or any other equivalent mechanism.
# Should only be used by ebuild developers. Should not be set from ebuild.
#
# This variable does not alter IUSE, KOTLIN_COMPAT, KOTLIN_SINGLE_TARGET, or
# dependencies. The KOTLIN_SINGLE_TARGET setting is ignored.  Dependencies for
# the Kotlin feature release (including compiler and libraries) will not be
# enforced by this eclass and thus must be installed manually.
#
# Example:
# @CODE
# env KOTLIN_COMPAT_OVERRIDE="kotlin1-5" emerge -a1 dev-java/foo-bar
# @CODE

# @ECLASS-VARIABLE: KOTLIN_WANT_TARGET
# @DEFAULT_UNSET
# @DESCRIPTION:
# The argument to kotlinc's -api-version and -language-version options.
# Default is unset, can be overridden from ebuild anywhere. It is the ebuild
# itself's responsibility to make sure the target version is supported by any
# Kotlin compiler version that will ever be used to build this package.

# ebuild variables

# @ECLASS-VARIABLE: KOTLIN_IUSE
# @DEFAULT_UNSET
# @PRE_INHERIT
# @DESCRIPTION:
# A list of special USE flags to add to IUSE which affects this eclass's
# behaviors. Default is unset. Although kotlin-utils.eclass does not require
# this variable to be set before it is inherited, other eclasses that inherit
# this eclass, like kotlin.eclass and kotlin-libs.eclass, may require it to be
# set before they are inherited.
#
# The following USE flags are recognized for this variable:
# - source: Install a source archive containing the source files being compiled
# - test: Let this eclass automatically run tests during the src_test phase

# Read-only variables

# @ECLASS-VARIABLE: KOTLIN_SLOT_DEP
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# A placeholder variable supported by kotlin-utils_gen_slot_dep, whose value
# will be the slot of Kotlin library packages for the feature release. This
# allows depending on Kotlin library packages for the same Kotlin feature
# release version selected via KOTLIN_SINGLE_TARGET.
#
# Example:
# @CODE
# DEPEND="
#	$(kotlin-utils_gen_slot_dep '
#		dev-java/kotlin-stdlib:${KOTLIN_SLOT_DEP}
#	')
# "
# @CODE

# @ECLASS-VARIABLE: KOTLIN_UTILS_DEPS
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# A dependency specification for Kotlin compiler for feature release versions
# listed in KOTLIN_COMPAT. Note that other eclasses that inherit this eclass,
# like kotlin.eclass and kotlin-libs.eclass, may already put the value of this
# variable in DEPEND, so ebuilds using those eclasses might not need to use
# this variable.
#
# Example:
# @CODE
# DEPEND="
# 	${KOTLIN_UTILS_DEPS}
# 	dev-java/foo-bar:0
# "
# @CODE
#
# Example value:
# @CODE
# kotlin_single_target_kotlin1-4? ( virtual/kotlin:1.4 )
# kotlin_single_target_kotlin1-5? ( virtual/kotlin:1.5 )
# @CODE

# @ECLASS-VARIABLE: KOTLIN_UTILS_SELECTED_VERSION
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# The Kotlin feature release version selected for this package based on
# KOTLIN_COMPAT_OVERRIDE and KOTLIN_SINGLE_TARGET. Will be set by this eclass
# and be available after the kotlin-utils_pkg_setup function is called.
#
# Example value:
# @CODE
# 1.5
# @CODE

# @ECLASS-VARIABLE: KOTLIN_UTILS_CLASSES
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# The directory where compiled classes will be stored relative to ${S}.
KOTLIN_UTILS_CLASSES="target/classes"
readonly KOTLIN_UTILS_CLASSES

# @ECLASS-VARIABLE: KOTLIN_UTILS_COMPILER_HOME
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# The path to the Kotlin compiler installation that will be used for building
# this package. Will be set by this eclass and be available after the
# kotlin-utils_pkg_setup function is called.

# @ECLASS-VARIABLE: KOTLIN_UTILS_TEST_CLASSPATH
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# The classpath needed to run tests. Will be set by this eclass and be
# available after the kotlin-utils_test_compile function is called.

# @ECLASS-VARIABLE: KOTLIN_UTILS_TESTS_TO_RUN
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# A space-separated list of test classes to run for the src_test phase. Will be
# set by this eclass and be available after the kotlin-utils_test_compile
# function is called.

# Internal variables

# @ECLASS-VARIABLE: _KOTLIN_UTILS_ALL_VERSIONS
# @INTERNAL
# @DESCRIPTION:
# An array of identifiers for all Kotlin compiler feature release versions
# available on Gentoo.
_KOTLIN_UTILS_ALL_VERSIONS=( kotlin1-{4..6} )
readonly _KOTLIN_UTILS_ALL_VERSIONS

# @ECLASS-VARIABLE: _KOTLIN_UTILS_LIBS_ONLY_VERSIONS
# @INTERNAL
# @DESCRIPTION:
# An array of identifiers for Kotlin compiler feature release versions
# available on Gentoo that are exclusively for building Kotlin library
# packages. Other Kotlin packages may not be built with these versions.
_KOTLIN_UTILS_LIBS_ONLY_VERSIONS=()
readonly _KOTLIN_UTILS_LIBS_ONLY_VERSIONS

# @ECLASS-VARIABLE: _KOTLIN_UTILS_SUPPORTED_VERSIONS
# @INTERNAL
# @DESCRIPTION:
# An array of identifiers for all Kotlin compiler feature release versions
# supported by the ebuild according to the value of KOTLIN_COMPAT.

# @ECLASS-VARIABLE: _KOTLIN_UTILS_KOTLIN_LIBS_ECLASS
# @INTERNAL
# @PRE_INHERIT
# @DESCRIPTION:
# A non-empty value indicates that kotlin-libs.eclass is being inherited.
# Should only be set by kotlin-libs.eclass BEFORE inheriting this eclass.

inherit java-pkg-2 java-pkg-simple

IUSE="${KOTLIN_IUSE}"
has test ${KOTLIN_IUSE} && RESTRICT+=" !test? ( test )"

# @FUNCTION: kotlin-utils_gen_slot_dep
# @USAGE: <dependencies>
# @DESCRIPTION:
# Transforms specified dependency specifications to new ones made conditional
# to USE_EXPAND flags in KOTLIN_SINGLE_TARGET, whose slots are set for the
# corresponding Kotlin feature release version. Verbatim '${KOTLIN_SLOT_DEP}'
# (quoted) may be placed in the dependency specifications passed in. It will be
# replaced by the correct slot.
#
# This function only accepts a single argument. If multiple dependency
# specifications need to be transformed, a convenient way to process them all
# at once is to wrap them all in a pair of single quotes (').
#
# Note that this function should not be called in CP_DEPEND, as
# java-utils-2.eclass does not support USE-conditional dependencies in it. To
# deal with this issue, this eclass provides another kotlin-utils_gen_slot_cp
# function for conveniently generating a list of packages that can be used in
# the value of JAVA_GENTOO_CLASSPATH.
#
# Example:
# @CODE
# KOTLIN_COMPAT=( kotlin1-{4..5} )
#
# KOTLIN_DEPEND="$(kotlin-utils_gen_slot_dep '
#	dev-java/kotlin-stdlib:${KOTLIN_SLOT_DEP}
# ')"
# CP_DEPEND="
#	dev-java/foo-bar:0
# "
# DEPEND="
#	${KOTLIN_DEPEND}
#	${CP_DEPEND}
# "
# RDEPEND="
#	${KOTLIN_DEPEND}
#	${CP_DEPEND}
# "
# @CODE
#
# Example output:
# @CODE
# kotlin_single_target_kotlin1-4? ( dev-java/kotlin-stdlib:1.4 )
# kotlin_single_target_kotlin1-5? ( dev-java/kotlin-stdlib:1.5 )
# @CODE
kotlin-utils_gen_slot_dep() {
	debug-print-function ${FUNCNAME} "${@}"
	[[ "${#}" -eq 1 ]] || die "Exactly one argument needed for ${FUNCNAME}"

	local deps ver

	for ver in "${_KOTLIN_UTILS_SUPPORTED_VERSIONS[@]}"; do
		local slot="${ver#kotlin}"
		slot="${slot//-/.}"
		deps+=" kotlin_single_target_${ver}? ( "
		deps+="${1//\$\{KOTLIN_SLOT_DEP\}/${slot}}"
		deps+=" )"
	done

	echo "${deps}"
}

# @FUNCTION: kotlin-utils_gen_slot_cp
# @USAGE: <dependencies>...
# @DESCRIPTION:
# Transforms specified dependencies to a string that can be used in values for
# lists of Java packages in Java eclasses, whose slots are set for the
# corresponding Kotlin feature release version specified by
# KOTLIN_SINGLE_TARGET. Verbatim '${KOTLIN_SLOT_DEP}' (quoted) may be placed in
# the argument passed in. It will be replaced by the correct slot.
#
# The output of this function may be used in the values of
# JAVA_GENTOO_CLASSPATH, JAVA_CLASSPATH_EXTRA and JAVA_TEST_GENTOO_CLASSPATH
# variables.
#
# The following argument formats are supported:
# - ${CATEGORY}/${PN}:${KOTLIN_SLOT_DEP}
# - ${PN}:${KOTLIN_SLOT_DEP}
# - ${PN}-${KOTLIN_SLOT_DEP}
# - ${CATEGORY}/${PN} (The slot will not be added in this case)
# - ${PN} (The slot will not be added in this case)
# Dependencies should be separated by white space.
#
# This function must be called after kotlin-utils_pkg_setup has been called.
#
# Example:
# @CODE
# KOTLIN_COMPAT=( kotlin1-5 )
#
# KOTLIN_LIBS='
#	dev-java/kotlin-reflect:${KOTLIN_SLOT_DEP}
#	dev-java/kotlin-stdlib:${KOTLIN_SLOT_DEP}
# '
# KOTLIN_DEPEND="$(kotlin-utils_gen_slot_dep "${KOTLIN_LIBS}")"
# DEPEND="
#	${KOTLIN_DEPEND}
#	dev-java/foo-bar:0
# "
# JAVA_GENTOO_CLASSPATH="foo-bar"
#
# pkg_setup() {
#	java-pkg-2_pkg_setup
#	kotlin-utils_pkg_setup
#	JAVA_GENTOO_CLASSPATH+=",$(kotlin-utils_gen_slot_cp "${KOTLIN_LIBS}")"
# }
# @CODE
#
# Example output:
# @CODE
# kotlin-reflect-1.5,kotlin-stdlib-1.5
# @CODE
kotlin-utils_gen_slot_cp() {
	debug-print-function ${FUNCNAME} "${@}"

	local ver="${KOTLIN_UTILS_SELECTED_VERSION}"
	[[ -n "${ver}" ]] || die "${FUNCNAME} called before kotlin-utils_pkg_setup"
	local cp_extra_pkgs pkg
	for pkg in ${@}; do
		pkg="${pkg#*/}"
		pkg="${pkg//\$\{KOTLIN_SLOT_DEP\}/${ver}}"
		pkg="${pkg//:/-}"
		cp_extra_pkgs+=( "${pkg}" )
	done
	local OLD_IFS="${IFS}"
	IFS=','
	local cp_extra="${cp_extra_pkgs[*]}"
	IFS="${OLD_IFS}"
	echo "${cp_extra}"
}

# @FUNCTION: kotlin-utils_iuse_depend
# @DESCRIPTION:
# Echoes a dependency specification for USE flags added to KOTLIN_IUSE. In
# particular, if the 'test' USE flag exists, then the dependency specification
# will contain packages for KOTLIN_TESTING_FRAMEWORKS.
kotlin-utils_iuse_depend() {
	debug-print-function ${FUNCNAME} "${@}"

	local deps

	if has source ${KOTLIN_IUSE}; then
		deps+=" source? ( app-arch/zip )"
	fi

	if has test ${KOTLIN_IUSE}; then
		local framework test_deps
		for framework in ${KOTLIN_TESTING_FRAMEWORKS}; do
			case "${framework}" in
				junit-4)
					test_deps+=" dev-java/junit:4" ;;
				pkgdiff)
					test_deps+=" amd64? (
						dev-util/pkgdiff
						dev-util/japi-compliance-checker
					)" ;;
			esac
		done
		[[ -n "${test_deps}" ]] && deps+=" test? ( ${test_deps} )"
	fi

	echo "${deps}"
}

# @FUNCTION: _kotlin-utils_process_kotlin_compat
# @INTERNAL
# @DESCRIPTION:
# Sets ebuild variables according to elements in KOTLIN_COMPAT. Should be
# called exactly once.
_kotlin-utils_process_kotlin_compat() {
	debug-print-function ${FUNCNAME} "${@}"

	if ! declare -p KOTLIN_COMPAT &> /dev/null; then
		die "KOTLIN_COMPAT is not declared in ebuild"
	fi
	if [[ "$(declare -p KOTLIN_COMPAT)" != "declare -a KOTLIN_COMPAT"* ]]; then
		die "KOTLIN_COMPAT is not declared as an array in ebuild"
	fi

	local ver
	for ver in "${_KOTLIN_UTILS_ALL_VERSIONS[@]}"; do
		if has "${ver}" "${KOTLIN_COMPAT[@]}"; then
			_KOTLIN_UTILS_SUPPORTED_VERSIONS+=( "${ver}" )
		fi
	done
	if [[ "${_KOTLIN_UTILS_KOTLIN_LIBS_ECLASS}" ]]; then
		for ver in "${_KOTLIN_UTILS_LIBS_ONLY_VERSIONS[@]}"; do
			if has "${ver}" "${KOTLIN_COMPAT[@]}"; then
				_KOTLIN_UTILS_SUPPORTED_VERSIONS+=( "${ver}" )
			fi
		done
	fi

	[[ -n "${_KOTLIN_UTILS_SUPPORTED_VERSIONS[@]}" ]] ||
		die "No supported version in KOTLIN_COMPAT"

	local iuse=(
		"${_KOTLIN_UTILS_SUPPORTED_VERSIONS[@]/#/kotlin_single_target_}"
	)
	if [[ "${#iuse[@]}" -eq 1 ]]; then
		# Enable the USE flag for the only supported Kotlin version by default
		IUSE+=" +${iuse[0]}"
	else
		IUSE+=" ${iuse[*]}"
	fi
	REQUIRED_USE="^^ ( ${iuse[*]} )"

	local iuse_flag
	for iuse_flag in "${iuse[@]}"; do
		local slot="${iuse_flag#kotlin_single_target_kotlin}"
		slot="${slot//-/.}"
		KOTLIN_UTILS_DEPS+=" ${iuse_flag}? ( virtual/kotlin:${slot} )"
	done

	readonly _KOTLIN_UTILS_SUPPORTED_VERSIONS
	readonly KOTLIN_UTILS_DEPS
}

_kotlin-utils_process_kotlin_compat
unset -f _kotlin-utils_process_kotlin_compat

# @FUNCTION: _kotlin-utils_set_kotlin_ver
# @INTERNAL
# @DESCRIPTION:
# Sets KOTLIN_UTILS_SELECTED_VERSION to the feature release version of Kotlin
# compiler selected to build this package.
_kotlin-utils_set_kotlin_ver() {
	debug-print-function ${FUNCNAME} "${@}"

	local ver_id
	if [[ -n "${KOTLIN_COMPAT_OVERRIDE}" ]]; then
		local override_vers=( ${KOTLIN_COMPAT_OVERRIDE} )
		[[ "${#override_vers[@]}" -eq 1 ]] ||
			die "Not exactly one version selected in KOTLIN_COMPAT_OVERRIDE"
		ver_id="${override_vers[0]}"
		ewarn "KOTLIN_COMPAT_OVERRIDE is in effect. This build will behave"
		ewarn "like if ${ver_id} were in KOTLIN_COMPAT and were enabled"
		ewarn "in KOTLIN_SINGLE_TARGET alone. However, dependencies for"
		ewarn "${ver_id} will not be enforced."
	else
		local compat_ver
		for compat_ver in "${_KOTLIN_UTILS_SUPPORTED_VERSIONS[@]}"; do
			if use "kotlin_single_target_${compat_ver}"; then
				[[ -z "${ver_id}" ]] ||
					die "Multiple versions selected in KOTLIN_SINGLE_TARGET"
				ver_id="${compat_ver}"
			fi
		done
	fi
	[[ -n "${ver_id}" ]] || die "No version selected in KOTLIN_SINGLE_TARGET"

	local ver="${ver_id#kotlin}"
	ver="${ver//-/.}"
	debug-print "${FUNCNAME}: Selected Kotlin ${ver}"
	KOTLIN_UTILS_SELECTED_VERSION="${ver}"
	readonly KOTLIN_UTILS_SELECTED_VERSION
}

# @FUNCTION: _kotlin-utils_set_compiler_home
# @INTERNAL
# @DESCRIPTION:
# Sets KOTLIN_UTILS_COMPILER_HOME to the Kotlin compiler installation that will
# be used for building this package. This function should be called only in
# pkg_* phases.
_kotlin-utils_set_compiler_home() {
	debug-print-function ${FUNCNAME} "${@}"

	local prefs_root="${EROOT}/etc/eselect/kotlin/homes"
	local ver="${KOTLIN_UTILS_SELECTED_VERSION}"
	local home="$(readlink "${prefs_root}/${ver}")"
	if [[ "${?}" -ne 0 ]] || [[ -z "${home}" ]]; then
		die "Failed to get installation path of Kotlin compiler ${ver}"
	fi
	KOTLIN_UTILS_COMPILER_HOME="${home}"
	readonly KOTLIN_UTILS_COMPILER_HOME
}

# @FUNCTION: kotlin-utils_pkg_setup
# @DESCRIPTION:
# Selects the Kotlin feature release target based on KOTLIN_COMPAT_OVERRIDE and
# KOTLIN_SINGLE_TARGET, then selects a compiler to be used for building this
# package and outputs its information if a Kotlin compiler is needed.
kotlin-utils_pkg_setup() {
	debug-print-function ${FUNCNAME} "${@}"

	# Kotlin version is computed solely from eclass variables and USE flags
	_kotlin-utils_set_kotlin_ver

	# The Kotlin compiler is only a build dependency: the JAR produced is
	# compatible with JVM, and a JRE is good for using it during runtime.
	# Therefore, it is possible that the Kotlin compiler is not installed
	# when the merge type is binary, and in this case, compiler selection
	# should be skipped.
	[[ "${MERGE_TYPE}" == "binary" ]] && return

	[[ "${KOTLIN_SKIP_COMPILER_SETUP}" ]] && return
	_kotlin-utils_set_compiler_home
	local compiler_pkg="$(basename "${KOTLIN_UTILS_COMPILER_HOME}")"
	einfo "Using Kotlin compiler package: ${compiler_pkg}"
}

# @FUNCTION: kotlin-utils_kotlinc
# @USAGE: <kotlinc_arguments>
# @DESCRIPTION:
# Invokes the Kotlin compiler with arguments specified by the eclass variables,
# followed by <kotlinc_arguments>.
kotlin-utils_kotlinc() {
	debug-print-function ${FUNCNAME} "${@}"

	local compiler_executable
	compiler_executable="kotlinc"

	# Prepare arguments whose values should be separated by comma
	local OLD_IFS="${IFS}"
	if [[ -n "${KOTLIN_COMMON_SOURCES_DIR[@]}" ]]; then
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
		${KOTLIN_WANT_TARGET:+-api-version "${KOTLIN_WANT_TARGET}"}
		${KOTLIN_WANT_TARGET:+-language-version "${KOTLIN_WANT_TARGET}"}
		${KOTLIN_MODULE_NAME:+-module-name "${KOTLIN_MODULE_NAME}"}
		${common_sources:+"${common_sources}"}
		${java_source_roots:+"${java_source_roots}"}
		"${KOTLIN_KOTLINC_ARGS[@]}"
		"${@}"
	)

	if [[ -n "${JAVA_PKG_DEBUG}" ]]; then
		einfo "Verbose logging for \"${FUNCNAME}\" function"
		einfo "JAVA_OPTS: ${KOTLIN_KOTLINC_JAVA_OPTS}"
		einfo "Compiler arguments:"
		einfo "${compiler_command_args[@]}"
	fi

	einfo "Compiling ..."
	GENTOO_KOTLIN_VER="${KOTLIN_UTILS_SELECTED_VERSION}" \
		JAVA_OPTS="${KOTLIN_KOTLINC_JAVA_OPTS}" \
		"${compiler_command_args[@]}" || die "${FUNCNAME} failed"
}

# @FUNCTION: kotlin-utils_src_compile
# @DESCRIPTION:
# Compiles the source files in KOTLIN_SRC_DIR using compiler arguments
# specified by other variables of this eclass, with classpath calculated from
# JAVA_GENTOO_CLASSPATH. Note that this function does not generate the JAR.
kotlin-utils_src_compile() {
	debug-print-function ${FUNCNAME} "${@}"

	java-pkg_gen-cp JAVA_GENTOO_CLASSPATH

	# Create the target directory
	mkdir -p "${KOTLIN_UTILS_CLASSES}" ||
		die "Could not create the target directory for compiled classes"

	# Compute classpath
	# Include the target directory because it may already contain classes
	# compiled from Java sources that Kotlin sources depend on
	local classpath="${KOTLIN_UTILS_CLASSES}"
	java-pkg-simple_getclasspath

	java-pkg-simple_prepend_resources \
		"${KOTLIN_UTILS_CLASSES}" "${JAVA_RESOURCE_DIRS[@]}"

	# Compile Kotlin source files
	local kotlin_sources="kotlin_sources.lst"
	find "${KOTLIN_SRC_DIR[@]}" -name "*.kt" > "${kotlin_sources}"
	kotlin-utils_kotlinc \
		-d "${KOTLIN_UTILS_CLASSES}" \
		${classpath:+-classpath "${classpath}"} \
		"@${kotlin_sources}"
	# Compile any Java source files after the Kotlin sources because
	# the Java sources require the Kotlin classes as dependencies
	if [[ -n "${KOTLIN_JAVA_SOURCE_ROOTS[@]}" ]]; then
		local java_sources="java_sources.lst"
		local java_classpath="${classpath:+${classpath}:}${KOTLIN_UTILS_CLASSES}"
		find "${KOTLIN_JAVA_SOURCE_ROOTS[@]}" -name "*.java" > "${java_sources}"
		einfo "Compiling Java sources ..."
		$(java-pkg_get-javac) \
			-d "${KOTLIN_UTILS_CLASSES}" \
			-classpath "${java_classpath}" \
			-encoding "${JAVA_ENCODING}" \
			${KOTLIN_JAVA_WANT_SOURCE_TARGET:+-source "${KOTLIN_JAVA_WANT_SOURCE_TARGET}"} \
			${KOTLIN_JAVA_WANT_SOURCE_TARGET:+-target "${KOTLIN_JAVA_WANT_SOURCE_TARGET}"} \
			"${KOTLIN_JAVAC_ARGS[@]}" \
			"@${java_sources}" || die "Failed to compile Java sources"
	fi
}

# @FUNCTION: kotlin-utils_jar
# @DESCRIPTION:
# Creates a JAR at JAVA_JAR_FILENAME from the files generated during
# compilation at JAVA_JAR_FILENAME, or updates the JAR if it already exists. If
# the file ${KOTLIN_UTILS_CLASSES}/META-INF/MANIFEST.MF exists, it will be used
# as the manifest of the created JAR.
kotlin-utils_jar() {
	debug-print-function ${FUNCNAME} "${@}"

	[[ -d "${KOTLIN_UTILS_CLASSES}" ]] ||
		die "Cannot create JAR before any sources are compiled"
	local jar_args
	if [[ -f "${JAVA_JAR_FILENAME}" ]]; then
		jar_args="-u"
	else
		jar_args="-c"
	fi
	if [[ -e "${KOTLIN_UTILS_CLASSES}/META-INF/MANIFEST.MF" ]]; then
		jar_args+="fm ${JAVA_JAR_FILENAME} ${KOTLIN_UTILS_CLASSES}/META-INF/MANIFEST.MF"
	elif [[ -n "${JAVA_MAIN_CLASS}" ]]; then
		jar_args+="fe ${JAVA_JAR_FILENAME} ${JAVA_MAIN_CLASS}"
	else
		jar_args+="f ${JAVA_JAR_FILENAME}"
	fi
	jar ${jar_args} -C "${KOTLIN_UTILS_CLASSES}" . || die "Failed to create JAR"
}

# @FUNCTION: kotlin-utils_test_compile
# @DESCRIPTION:
# Compiles the test source files in KOTLIN_TEST_SRC_DIR using compiler
# arguments during the test specified by other variables of this eclass.
kotlin-utils_test_compile() {
	debug-print-function ${FUNCNAME} "${@}"

	local classes="target/test-classes"
	# Create the target directory
	mkdir -p "${classes}" ||
		die "Could not create the target directory for test classes"

	# Compute classpath
	local classpath="${classes}:${JAVA_JAR_FILENAME}"
	java-pkg-simple_getclasspath
	if has test ${KOTLIN_IUSE} && use test; then
		local dependency
		for dependency in ${JAVA_TEST_GENTOO_CLASSPATH}; do
			classpath="${classpath}:$(java-pkg_getjars \
				--build-only --with-dependencies "${dependency}")"
		done
	fi

	java-pkg-simple_prepend_resources \
		"${classes}" "${JAVA_TEST_RESOURCE_DIRS[@]}"

	# Compile Kotlin test files
	local kotlin_sources="kotlin_test_sources.lst"
	find "${KOTLIN_TEST_SRC_DIR[@]}" -name "*.kt" > "${kotlin_sources}"

	# If there are no Kotlin test sources, skip compilation of any test sources
	[[ -s "${kotlin_sources}" ]] || return

	# Set compiler arguments for tests; use 'local' to restore the
	# variables to their original values after this function returns
	local KOTLIN_COMMON_SOURCES_DIR=( "${KOTLIN_TEST_COMMON_SOURCES_DIR[@]}" )
	local KOTLIN_KOTLINC_ARGS=( "${KOTLIN_TEST_KOTLINC_ARGS[@]}" )
	local KOTLIN_KOTLINC_JAVA_OPTS="${KOTLIN_TEST_KOTLINC_JAVA_OPTS}"
	local KOTLIN_JAVA_SOURCE_ROOTS=( "${KOTLIN_TEST_JAVA_SOURCE_ROOTS[@]}" )

	kotlin-utils_kotlinc \
		-d "${classes}" \
		${classpath:+-classpath "${classpath}"} \
		"@${kotlin_sources}"

	# Compile any Java test source files after the Kotlin test sources because
	# the Java sources may require some of the Kotlin classes as dependencies
	if [[ -n "${KOTLIN_TEST_JAVA_SOURCE_ROOTS[@]}" ]]; then
		local java_sources="java_test_sources.lst"
		find "${KOTLIN_TEST_JAVA_SOURCE_ROOTS[@]}" -name "*.java" \
			> "${java_sources}"
		einfo "Compiling Java sources ..."
		$(java-pkg_get-javac) \
			-d "${classes}" \
			-classpath "${classpath}" \
			-encoding "${JAVA_ENCODING}" \
			${KOTLIN_TEST_JAVA_WANT_SOURCE_TARGET:+-source "${KOTLIN_TEST_JAVA_WANT_SOURCE_TARGET}"} \
			${KOTLIN_TEST_JAVA_WANT_SOURCE_TARGET:+-target "${KOTLIN_TEST_JAVA_WANT_SOURCE_TARGET}"} \
			"${KOTLIN_TEST_JAVAC_ARGS[@]}" \
			"@${java_sources}" || die "Failed to compile Java test sources"
	fi

	local tests_to_run
	if [[ -n "${KOTLIN_TEST_RUN_ONLY[@]}" ]]; then
		tests_to_run="${KOTLIN_TEST_RUN_ONLY[@]}"
	else
		tests_to_run=$(find "${classes}" -type f \
			\( -name "*Test.class" \
			-o -name "Test*.class" \
			-o -name "*Tests.class" \
			-o -name "*TestCase.class" \) \
			! -name "*Abstract*"\
			! -name "*BaseTest*"\
			! -name "*TestTypes*"\
			! -name "*TestUtils*"\
			! -name "*\$*" \
			! -name "*Kt.class")
		tests_to_run=${tests_to_run//"${classes}"\/}
		tests_to_run=${tests_to_run//.class}
		tests_to_run=${tests_to_run//\//.}
		local class
		for class in "${KOTLIN_TEST_EXCLUDES[@]}"; do
			tests_to_run=${tests_to_run//${class}}
		done
	fi

	KOTLIN_UTILS_TEST_CLASSPATH="${classpath}"
	KOTLIN_UTILS_TESTS_TO_RUN="${tests_to_run}"
	readonly KOTLIN_UTILS_TEST_CLASSPATH KOTLIN_UTILS_TESTS_TO_RUN
}

# @FUNCTION: kotlin-utils_src_test
# @DESCRIPTION:
# Performs tests with frameworks defined in KOTLIN_TESTING_FRAMEWORKS.
kotlin-utils_src_test() {
	debug-print-function ${FUNCNAME} "${@}"

	if ! has test ${KOTLIN_IUSE}; then
		return
	elif ! use test; then
		return
	elif [[ -z "${KOTLIN_TESTING_FRAMEWORKS}" ]]; then
		return
	fi

	local compile_if_framework=( junit-4 )
	local compile framework
	for framework in "${compile_if_framework[@]}"; do
		if has "${framework}" ${KOTLIN_TESTING_FRAMEWORKS}; then
			compile=1
		fi
	done
	if [[ "${compile}" ]]; then
		kotlin-utils_test_compile
	fi

	for framework in ${KOTLIN_TESTING_FRAMEWORKS}; do
		case "${framework}" in
			junit-4)
				ejunit4 -classpath "${KOTLIN_UTILS_TEST_CLASSPATH}" \
					${KOTLIN_UTILS_TESTS_TO_RUN} ;;
			pkgdiff)
				java-pkg-simple_test_with_pkgdiff_ ;;
			*)
				elog "Testing framework ${framework} is not supported yet" ;;
		esac
	done
}

# @FUNCTION: kotlin-utils_dosrc
# @USAGE: <path/to/sources> [...]
# @DESCRIPTION:
# Installs a Zip archive containing the specified sources for a package.
# To use this function, app-arch/zip needs to be present in DEPEND.
kotlin-utils_dosrc() {
	debug-print-function ${FUNCNAME} "${@}"

	java-pkg_check-phase install

	[[ "${#}" -ge 1 ]] || die "At least one argument needed for ${FUNCNAME}"

	if [[ "${DEPEND}" != *app-arch/zip* ]]; then
		local msg="${FUNCNAME} called without app-arch/zip in DEPEND"
		java-pkg_announce-qa-violation "${msg}"
	fi

	java-pkg_init_paths_

	local zip_name="${PN}-src.zip"
	local zip_path="${T}/${zip_name}"
	local path
	for path in "${@}"; do
		pushd "${path}" > /dev/null || die "Failed to enter directory ${path}"
		zip -q -r "${zip_path}" *
		local result="${?}"
		# 12 means zip has nothing to do
		if [[ "${result}" -ne 12 && "${result}" -ne 0 ]]; then
			die "Failed to add ${dir_name} to Zip archive"
		fi
		popd > /dev/null || die "Failed to exit directory ${path}"
	done

	insinto "${JAVA_PKG_SOURCESPATH}"
	doins "${zip_path}"

	if [[ -n "${JAVA_PKG_DEBUG}" ]]; then
		einfo "Verbose logging for \"${FUNCNAME}\" function"
		einfo "Zip filename created: ${zip_name}"
		einfo "Zip file destination: ${JAVA_PKG_SOURCESPATH}"
		einfo "Paths zipped: ${@}"
		einfo "Complete command:"
		einfo "${FUNCNAME} ${@}"
	fi

	JAVA_SOURCES="${JAVA_PKG_SOURCESPATH}/${zip_name}"
	java-pkg_do_write_
}

_KOTLIN_UTILS_INHERITED=1
fi
