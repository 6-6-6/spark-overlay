# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit java-pkg-2

DESCRIPTION="Statically typed programming language for modern multiplatform applications"
HOMEPAGE="https://kotlinlang.org/"
SRC_URI="
	https://github.com/JetBrains/kotlin/releases/download/v${PV}/kotlin-compiler-${PV}.zip
"

LICENSE="Apache-2.0 BSD MIT NPL-1.1"
SLOT="0"
KEYWORDS="~amd64"

KOTLIN_LIB_SLOT="$(ver_cut 1-2)"
COROUTINES_CORE_SLOT="1.3.8"
JB_ANNOTATIONS_SLOT="13"

RDEPEND="
	~dev-java/kotlin-stdlib-${PV}:${KOTLIN_LIB_SLOT}
	~dev-java/kotlin-reflect-${PV}:${KOTLIN_LIB_SLOT}
	dev-java/kotlinx-coroutines-core-bin:${COROUTINES_CORE_SLOT}
	dev-java/jetbrains-annotations:${JB_ANNOTATIONS_SLOT}
	dev-java/jetbrains-trove:0
	>=virtual/jdk-1.8:*
"
BDEPEND="
	app-arch/unzip
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/kotlinc"

# An array of JARs to be recorded in the package.env file
KOTLINC_EXPORTED_LIBS=(
	kotlin-compiler.jar
)

# An array of JARs that should not be added to package.env and thus used only
# by the compiler as private libraries
KOTLINC_PRIVATE_LIBS=(
	allopen-compiler-plugin.jar
	android-extensions-compiler.jar
	android-extensions-runtime.jar
	js.engines.jar
	jvm-abi-gen.jar
	kotlin-annotation-processing.jar
	kotlin-annotation-processing-cli.jar
	kotlin-annotation-processing-runtime.jar
	kotlin-ant.jar
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
	cp bin/* "${KOTLINC_BIN_TMP}" || die

	KOTLINC_LIB_TMP="${T}/lib"
	mkdir "${KOTLINC_LIB_TMP}" || die
	cp "${KOTLINC_EXPORTED_LIBS[@]/#/lib/}" "${KOTLINC_LIB_TMP}" || die
	cp "${KOTLINC_PRIVATE_LIBS[@]/#/lib/}" "${KOTLINC_LIB_TMP}" || die
	java-pkg_jar-from --into "${KOTLINC_LIB_TMP}" \
		"kotlin-stdlib-${KOTLIN_LIB_SLOT}"
	java-pkg_jar-from --into "${KOTLINC_LIB_TMP}" \
		"kotlin-reflect-${KOTLIN_LIB_SLOT}"
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
	local kotlin_home="/opt/${PN}"

	into "${kotlin_home}"
	for exe in "${KOTLINC_BIN_TMP}"/*; do
		dobin "${exe}"
		local basename=$(basename "${exe}" || die)
		dosym "../../${kotlin_home}/bin/${basename}" "/usr/bin/${basename}"
	done

	local exported_libs="${KOTLINC_EXPORTED_LIBS[@]/#/${KOTLINC_LIB_TMP}/}"
	local private_libs="${KOTLINC_PRIVATE_LIBS[@]/#/${KOTLINC_LIB_TMP}/}"
	# Install exported libraries
	java-pkg_jarinto "${kotlin_home}/lib"
	java-pkg_dojar ${exported_libs}
	# Install private libraries
	insinto "${kotlin_home}/lib"
	doins ${private_libs}
	# Install symbolic links to dependency libraries
	rm ${exported_libs} ${private_libs} || die
	doins "${KOTLINC_LIB_TMP}"/*

	# Remove copyright header template used for source files
	rm license/COPYRIGHT_HEADER.txt || die
	dodoc -r license/*
}
