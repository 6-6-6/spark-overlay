# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_PROVIDES="
	org.jetbrains.kotlin:${PN}:${PV}
	org.jetbrains.kotlin:kotlin-stdlib-common:${PV}
"

KOTLIN_LIBS_BINJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}.jar"
KOTLIN_LIBS_SRCJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}-sources.jar"

inherit kotlin-libs

KEYWORDS="~amd64"

DEPEND="!binary? (
	dev-java/jetbrains-annotations:13
	~dev-java/kotlin-core-builtins-${PV}:${SLOT}
)"

JAVA_CLASSPATH_EXTRA="
	jetbrains-annotations-13
	kotlin-core-builtins-${SLOT}
"
JAVA_BINJAR_FILENAME="${P}.jar"

KOTLIN_LIBS_KOTLINC_ARGS=(
	-jvm-target 1.6
	-no-stdlib
	-Xallow-kotlin-package
	-Xallow-no-source-files
	-Xallow-result-return-type
	-Xinline-classes
	-Xjvm-default=compatibility
	-Xmulti-platform
	-Xmultifile-parts-inherit
	-Xnormalize-constructor-calls=enable
	-Xopt-in=kotlin.RequiresOptIn
	-Xopt-in=kotlin.ExperimentalMultiplatform
	-Xopt-in=kotlin.contracts.ExperimentalContracts
	-Xsuppress-deprecated-jvm-target-warning
	-Xuse-14-inline-classes-mangling-scheme
	-Xuse-old-backend
)
KOTLIN_LIBS_JAVA_SOURCE_ROOTS=( libraries/stdlib/jvm/{src,runtime} )
KOTLIN_LIBS_COMMON_SOURCES_DIR=( libraries/stdlib/{,common,unsigned}/src )
KOTLIN_LIBS_SRC_DIR=(
	core/builtins/src
	libraries/stdlib/jvm/runtime
	libraries/stdlib/{,common,jvm,unsigned}/src
)
KOTLIN_LIBS_JAVA_ARGS=(
	-g
	-sourcepath
	-proc:none
	-XDuseUnsharedTable=true
)
KOTLIN_LIBS_JAVA_SRC_DIR=( libraries/stdlib/jvm/{src,runtime} )

src_unpack() {
	default
	if ! has binary ${JAVA_PKG_IUSE} || ! use binary; then
		unpack "$(java-pkg_getjar --build-only \
			"kotlin-core-builtins-${SLOT}" kotlin-core-builtins.jar)"
		local target="${S}/target"
		mkdir -p "${target}" || \
			die "Failed to create target directory for compiler output"
		mv kotlin "${target}" || \
			die "Failed to move built-ins to target directory"
	fi
}
