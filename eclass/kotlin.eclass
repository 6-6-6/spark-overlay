# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: kotlin.eclass
# @MAINTAINER:
# Yuan Liao <liaoyuan@gmail.com>
# @AUTHOR:
# Yuan Liao <liaoyuan@gmail.com>
# @SUPPORTED_EAPIS: 6 7 8
# @PROVIDES: kotlin-utils
# @BLURB: The eclass for Kotlin packages
# @DESCRIPTION:
# This eclass can be inherited by ebuilds for a Kotlin package to select a
# Kotlin compiler version required by the package and compile the package's
# sources. This eclass inherits kotlin-utils.eclass, and ebuilds inheriting
# this eclass should set variables declared in kotlin-utils.eclass to control
# how the package is built.
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

inherit kotlin-utils

DEPEND="
	${KOTLIN_UTILS_DEPS}
	$(kotlin-utils_iuse_depend)
"

EXPORT_FUNCTIONS pkg_setup src_compile src_install src_test

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

# @FUNCTION: kotlin_src_test
# @DESCRIPTION:
# Perform tests with frameworks defined in KOTLIN_TESTING_FRAMEWORKS.
kotlin_src_test() {
	kotlin-utils_src_test
}

# @FUNCTION: kotlin_src_install
# @DESCRIPTION:
# Installs the JAR specified by JAVA_JAR_FILENAME, and a launcher as well if
# JAVA_MAIN_CLASS is set.
kotlin_src_install() {
	java-pkg_dojar "${JAVA_JAR_FILENAME}"
	einstalldocs

	if [[ -n "${JAVA_MAIN_CLASS}" ]]; then
		java-pkg_dolauncher "${JAVA_LAUNCHER_FILENAME}" \
			--main "${JAVA_MAIN_CLASS}"
	fi

	if has source ${KOTLIN_IUSE} && use source; then
		local sources
		if [[ -s "java_sources.lst" ]]; then
			sources="sources.lst"
			cat kotlin_sources.lst java_sources.lst > "${sources}" || \
				die "Failed to create combined Kotlin and Java source list"
		elif [[ -s "kotlin_sources.lst" ]]; then
			sources="kotlin_sources.lst"
		else
			# Fall back to the source list file used by java-pkg-simple.eclass
			sources="sources.lst"
		fi

		local kt_java_src_dir=(
			"${KOTLIN_SRC_DIR[@]}"
			"${KOTLIN_JAVA_SOURCE_ROOTS[@]}"
			"${JAVA_SRC_DIR[@]}"
		)
		if [[ -n "${kt_java_src_dir[@]}" ]]; then
			kotlin-utils_dosrc "${kt_java_src_dir[@]}"
		else
			# Take all directories actually containing any sources
			kotlin-utils_dosrc $(cut -d/ -f1 "${sources}" | sort -u)
		fi
	fi
}
