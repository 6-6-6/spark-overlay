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

# @ECLASS-VARIABLE: KOTLIN_CORE_DEPS_INCLUDE_RESOURCES
# @DEFAULT_UNSET
# @DESCRIPTION:
# If a non-empty value is set, automatically include the resources for the
# package in the produced JAR. Default is unset, can be overriden from ebuild
# BEFORE inhering this eclass.

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

: ${DESCRIPTION:="Kotlin library build-time dependency ${PN}"}

inherit kotlin-libs

if [[ -n "${KOTLIN_CORE_DEPS_MODULE_NAME}" ]]; then
	KOTLIN_LIBS_MODULE_NAME="${KOTLIN_CORE_DEPS_MODULE_NAME}"
fi
: ${KOTLIN_LIBS_SRC_DIR:="core/${KOTLIN_LIBS_MODULE_NAME}/src"}
if [[ ! "${KOTLIN_CORE_DEPS_SKIP_JAVAC}" ]]; then
	: ${KOTLIN_LIBS_JAVA_SOURCE_ROOTS:="${KOTLIN_LIBS_SRC_DIR[@]}"}
fi

if [[ "${KOTLIN_CORE_INCLUDE_RESOURCES}" ]]; then
	: ${JAVA_RESOURCE_DIRS:="core/${KOTLIN_LIBS_MODULE_NAME}/resources"}
fi

if [[ -z "${KOTLIN_LIBS_KOTLINC_ARGS[@]}" ]]; then
	KOTLIN_LIBS_KOTLINC_ARGS=(
		-no-stdlib
		-Xallow-kotlin-package
		-Xallow-no-source-files
		-Xjvm-default=compatibility
		-Xno-kotlin-nothing-value-exception
		-Xno-optimized-callable-references
		-Xnormalize-constructor-calls=enable
		-Xopt-in=kotlin.RequiresOptIn
		-Xread-deserialized-contracts
		-Xuse-ir
	)
	_KOTLIN_CORE_DEPS_FEATURE_REL="$(ver_cut 2)"
	if [[ "${_KOTLIN_CORE_DEPS_FEATURE_REL}" -ge 5 ]]; then
		# Additional options for Kotlin 1.5
		KOTLIN_LIBS_KOTLINC_ARGS+=(
			-jvm-target 1.6
			-Xsuppress-deprecated-jvm-target-warning
		)
	fi
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

	if has binary ${JAVA_PKG_IUSE} && use binary; then
		return 0
	fi

	local sed_script
	sed_script="s/${KOTLIN_CORE_DEPS_SOURCE_PKG}/${KOTLIN_CORE_DEPS_DEST_PKG}/g"

	for src_dir in "${KOTLIN_LIBS_SRC_DIR[@]}"; do
		local source_pkg_path="${src_dir}/$(tr '.' '/' <<< \
			"${KOTLIN_CORE_DEPS_SOURCE_PKG}")"
		local dest_pkg_path="${src_dir}/$(tr '.' '/' <<< \
			"${KOTLIN_CORE_DEPS_DEST_PKG}")"
		if [[ -d "${source_pkg_path}" ]]; then
			mkdir -p "${dest_pkg_path}" || \
				die "Failed to create directory for relocation target package"
			mv "${source_pkg_path}"/* "${dest_pkg_path}" || \
				die "Failed to move source files to relocation target directory"
		fi
	done

	if [[ -n "${JAVA_RESOURCE_DIRS[@]}" ]]; then
		# Modify package name occurrences in resource file names
		find "${JAVA_RESOURCE_DIRS[@]}" \
			-type f -name "${KOTLIN_CORE_DEPS_SOURCE_PKG}.*" \
			-exec bash -c 'echo {} > ebuild-mv-dest' \; \
			-exec sed -i -e ${sed_script} ebuild-mv-dest \; \
			-exec bash -c 'mv {} $(cat ebuild-mv-dest)' \; \
			-exec rm ebuild-mv-dest \;
	fi

	local modify_dirs=(
		"${KOTLIN_LIBS_SRC_DIR[@]}"
		"${JAVA_RESOURCE_DIRS[@]}"
	)
	find "${modify_dirs[@]}" -type f -exec sed -i -e "${sed_script}" \
		{} \; || die "Failed to modify package names in source files"
}
