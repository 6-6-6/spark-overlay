# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit java-pkg-2 kotlin-compiler

DESCRIPTION="Statically typed programming language for modern multiplatform applications"
HOMEPAGE="https://kotlinlang.org/"
SRC_URI="
	https://github.com/JetBrains/kotlin/releases/download/v${PV}/kotlin-compiler-${PV}.zip
"

LICENSE="Apache-2.0 BSD MIT NPL-1.1"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"
IUSE="javascript"

COROUTINES_CORE_SLOT="1.5.0"
JB_ANNOTATIONS_SLOT="13"

RDEPEND="
	~dev-java/kotlin-stdlib-${PV}:${SLOT}
	~dev-java/kotlin-reflect-${PV}:${SLOT}
	dev-java/kotlinx-coroutines-core-bin:${COROUTINES_CORE_SLOT}
	dev-java/jetbrains-annotations:${JB_ANNOTATIONS_SLOT}
	dev-java/jetbrains-trove:0
	>=virtual/jdk-1.8:*
"
BDEPEND="
	app-arch/unzip
"
DEPEND="${RDEPEND}"
PDEPEND="
	javascript? ( ~dev-java/kotlin-stdlib-js-${PV}:${SLOT} )
"

S="${WORKDIR}/kotlinc"

KOTLIN_COMPILER_HOME="/opt/${PN}-${SLOT}"

KOTLINC_LIBS=(
	allopen-compiler-plugin.jar
	android-extensions-compiler.jar
	android-extensions-runtime.jar
	js.engines.jar
	jvm-abi-gen.jar
	kotlin-annotation-processing.jar
	kotlin-annotation-processing-cli.jar
	kotlin-annotation-processing-runtime.jar
	kotlin-ant.jar
	kotlin-compiler.jar
	kotlin-daemon-client.jar
	kotlin-daemon.jar
	kotlin-imports-dumper-compiler-plugin.jar
	kotlin-main-kts.jar
	kotlin-preloader.jar
	kotlin-runner.jar
	kotlin-scripting-common.jar
	kotlin-scripting-compiler-impl.jar
	kotlin-scripting-compiler.jar
	kotlin-scripting-js.jar
	kotlin-scripting-jvm.jar
	kotlin-script-runtime.jar
	kotlinx-serialization-compiler-plugin.jar
	lombok-compiler-plugin.jar
	mutability-annotations-compat.jar
	noarg-compiler-plugin.jar
	parcelize-compiler.jar
	parcelize-runtime.jar
	sam-with-receiver-compiler-plugin.jar
)

src_prepare() {
	java-pkg-2_src_prepare

	KOTLINC_BIN_TMP="${T}/bin"
	mkdir "${KOTLINC_BIN_TMP}" || die
	rm bin/*.bat || die
	if ! use javascript; then
		rm bin/kotlin*js || die
	fi
	cp bin/* "${KOTLINC_BIN_TMP}" || die

	KOTLINC_LIB_TMP="${T}/lib"
	mkdir "${KOTLINC_LIB_TMP}" || die
	cp "${KOTLINC_LIBS[@]/#/lib/}" "${KOTLINC_LIB_TMP}" || die

	# Create symbolic links to required Kotlin core library components
	java-pkg_jar-from --into "${KOTLINC_LIB_TMP}" \
		"kotlin-stdlib-${SLOT}"
	java-pkg_jar-from --into "${KOTLINC_LIB_TMP}" \
		"kotlin-reflect-${SLOT}"

	# Create symbolic links to external dependencies
	java-pkg_jar-from --into "${KOTLINC_LIB_TMP}" \
		"kotlinx-coroutines-core-bin-${COROUTINES_CORE_SLOT}" \
		kotlinx-coroutines-core-bin.jar kotlinx-coroutines-core.jar
	java-pkg_jar-from --into "${KOTLINC_LIB_TMP}" \
		"jetbrains-annotations-${JB_ANNOTATIONS_SLOT}" \
		jetbrains-annotations.jar annotations-13.0.jar
	java-pkg_jar-from --into "${KOTLINC_LIB_TMP}" \
		"jetbrains-trove" \
		jetbrains-trove.jar trove4j.jar
}

src_install() {
	into "${KOTLIN_COMPILER_HOME}"
	dobin "${KOTLINC_BIN_TMP}"/*

	insinto "${KOTLIN_COMPILER_HOME}/lib"
	doins "${KOTLINC_LIB_TMP}"/*

	# Remove copyright header template used for source files
	rm license/COPYRIGHT_HEADER.txt
	# Remove redundant copy of Apache-2.0 license
	rm license/LICENSE.txt
	dodoc -r license/*

	# build.txt required for 'kotlin -version'
	insinto "${KOTLIN_COMPILER_HOME}"
	doins build.txt
}
