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

DEPEND="!binary? ( dev-java/jetbrains-annotations:13 )"

JAVA_CLASSPATH_EXTRA="jetbrains-annotations-13"
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

src_compile() {
	if has binary ${JAVA_PKG_IUSE} && use binary; then
		kotlin-libs_src_compile
		return 0
	fi

	# Generate vital *.kotlin_builtins file prior to compilation
	# Process adapted from logic for the 'serialize' task in
	# core/builtins/build.gradle.kts
	local target="target"
	local builtins_cherry_picked="${T}/core/builtins/build/src"
	#local kotlinc_jar="$(java-pkg_getjar --build-only \
		#kotlin-bin kotlin-compiler.jar)"
	local kotlinc_jar="/opt/kotlin-bin/lib/kotlin-compiler.jar"

	mkdir -p "${target}" || die "Failed to create target directory"
	mkdir -p "${builtins_cherry_picked}" || \
		die "Failed to create temporary directory for cherry-picked built-ins"
	cp libraries/stdlib/src/kotlin/reflect/* "${builtins_cherry_picked}" || \
		die "Failed to copy sources for built-ins to temporary directory"
	rm "${builtins_cherry_picked}"/{typeOf.kt,KClasses.kt} || \
		die "Failed to remove extraneous sources from cherry-picked built-ins"
	ebegin "Serializing built-ins"
	# The built-in serializer needs to access XDG_CACHE_HOME, reassign it to
	# avoid access violations caused by 'mkdir /var/lib/portage/home/.cache'
	XDG_CACHE_HOME="${HOME}/.cache" \
	java -classpath "${kotlinc_jar}" \
		org.jetbrains.kotlin.serialization.builtins.RunKt \
		"${target}" \
		core/builtins/{src,native} "${builtins_cherry_picked}" || \
		die "Failed to serialize built-ins"

	kotlin-libs_src_compile
}