# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: kotlin-core-deps.eclass
# @MAINTAINER:
# Yuan Liao <liaoyuan@gmail.com>
# @AUTHOR:
# Yuan Liao <liaoyuan@gmail.com>
# @SUPPORTED_EAPIS: 6 7
# @BLURB: An eclass for building dev-java/kotlin-core-* packages
# @DESCRIPTION:
# This eclass provides functionality to relocate the sources for a
# dev-java/kotlin-core-* packages to a new path and hence a new Java package.
# The Gradle project in the Kotlin source tree uses the Gradle Shadow plugin to
# relocate those sources, but as its name suggests, the plugin is only
# available on Gradle. This eclass emulates relocation by moving the source
# files into a new path and replacing package names in the source files'
# contents before they are compiled. Because the dev-java/kotlin-core-*
# packages are only results of intermediate steps in building the Kotlin
# libraries, and the upstream does not provide them as public Kotlin libraries,
# no client Kotlin program is expected to depend on these packages, so it would
# be safe to introduce such API-incompatible changes like relocating classes to
# another Java package.

case "${EAPI:-0}" in
	6|7) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

EXPORT_FUNCTIONS src_prepare

# @ECLASS-VARIABLE: KOTLIN_CORE_DEPS_MODULE_NAME
# @DEFAULT_UNSET
# @PRE_INHERIT
# @DESCRIPTION:
# The value for KOTLIN_LIBS_MODULE_NAME. This variable will be used to
# determine the path to the sources. Default is unset, must be overriden from
# ebuild BEFORE inheriting this eclass unless the ebuild sets
# KOTLIN_LIBS_SRC_DIR itself.

# @ECLASS-VARIABLE: KOTLIN_CORE_DEPS_SKIP_JAVAC
# @DEFAULT_UNSET
# @PRE_INHERIT
# @DESCRIPTION:
# If a non-empty value is set, no Java source will be compiled. Default is
# unset, can be overriden from ebuild BEFORE inheriting this eclass.

# @ECLASS-VARIABLE: KOTLIN_CORE_DEPS_SOURCE_PKG
# @DESCRIPTION:
# The name of the Java package whose classes need to be relocated. Defaults to
# the root package of sources in all dev-java/kotlin-core-* packages, can be
# overriden from ebuild anywhere.
: ${KOTLIN_CORE_DEPS_SOURCE_PKG:="org.jetbrains.kotlin"}

# @ECLASS-VARIABLE: KOTLIN_CORE_DEPS_DEST_PKG
# @DESCRIPTION:
# The name of the destination Java package in the relocation. Defaults to the
# destination package expected by dev-java/kotlin-reflect, can be overriden
# from ebuild anywhere.
: ${KOTLIN_CORE_DEPS_DEST_PKG:="kotlin.reflect.jvm.internal.impl"}

inherit kotlin-libs

: ${DESCRIPTION:="Kotlin library build-time dependency ${PN}"}

if [[ -n "${KOTLIN_CORE_DEPS_MODULE_NAME}" ]]; then
	KOTLIN_LIBS_MODULE_NAME="${KOTLIN_CORE_DEPS_MODULE_NAME}"
fi
: ${KOTLIN_LIBS_SRC_DIR:="core/${KOTLIN_LIBS_MODULE_NAME}/src"}
if [[ ! "${KOTLIN_CORE_DEPS_SKIP_JAVAC}" ]]; then
	: ${KOTLIN_LIBS_JAVA_SOURCE_ROOTS:="${KOTLIN_LIBS_SRC_DIR[@]}"}
	: ${KOTLIN_LIBS_JAVA_SRC_DIR:="${KOTLIN_LIBS_SRC_DIR[@]}"}
fi

if [[ -z "${KOTLIN_LIBS_KOTLINC_ARGS[@]}" ]]; then
	KOTLIN_LIBS_KOTLINC_ARGS=(
		-jvm-target 1.6
		-no-stdlib
		-Xallow-kotlin-package
		-Xallow-no-source-files
		-Xjvm-default=compatibility
		-Xno-kotlin-nothing-value-exception
		-Xno-optimized-callable-references
		-Xnormalize-constructor-calls=enable
		-Xopt-in=kotlin.RequiresOptIn
		-Xread-deserialized-contracts
		-Xsuppress-deprecated-jvm-target-warning
		-Xuse-ir
	)
fi

if [[ -z "${KOTLIN_LIBS_JAVAC_ARGS[@]}" ]]; then
	KOTLIN_LIBS_JAVAC_ARGS=(
		-g
		-sourcepath
		-proc:none
		-XDuseUnsharedTable=true
	)
fi

# @FUNCTION: kotlin-core-deps_src_prepare
# @DESCRIPTION:
# Relocates the source files that are in the specified source package to the
# relocation target package requested.
kotlin-core-deps_src_prepare() {
	java-pkg-2_src_prepare

	local source_pkg_path="${KOTLIN_LIBS_SRC_DIR}/$(tr '.' '/' <<< \
		"${KOTLIN_CORE_DEPS_SOURCE_PKG}")"
	local dest_pkg_path="${KOTLIN_LIBS_SRC_DIR}/$(tr '.' '/' <<< \
		"${KOTLIN_CORE_DEPS_DEST_PKG}")"
	mkdir -p "${dest_pkg_path}" || \
		die "Failed to create directory for relocation target package"
	mv "${source_pkg_path}"/* "${dest_pkg_path}" || \
		die "Failed to move source files to relocation target directory"
	find "${dest_pkg_path}" -type f -exec sed -i -e \
		"s/${KOTLIN_CORE_DEPS_SOURCE_PKG}/${KOTLIN_CORE_DEPS_DEST_PKG}/g" \
		{} \; || die "Failed to modify package names in source files"
}
