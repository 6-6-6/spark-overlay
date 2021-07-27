# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit java-pkg-2 kotlin-compiler

DESCRIPTION="Statically typed programming language for modern multiplatform applications"
HOMEPAGE="https://kotlinlang.org/"
SRC_URI="
	https://github.com/JetBrains/kotlin/releases/download/v${PV}/kotlin-compiler-${PV}.zip
	test? (
		https://github.com/JetBrains/kotlin/archive/refs/tags/v${PV}.tar.gz -> kotlin-${PV}.tar.gz
	)
"

LICENSE="Apache-2.0 BSD MIT NPL-1.1"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

KOTLIN_LIB_SLOT="$(ver_cut 1-2)"
JB_ANNOTATIONS_SLOT="13"

RDEPEND="
	~dev-java/kotlin-common-bin-${PV}:${KOTLIN_LIB_SLOT}
	dev-java/jetbrains-annotations:${JB_ANNOTATIONS_SLOT}
	dev-java/jetbrains-trove:0
	>=virtual/jdk-1.8:*
"
BDEPEND="
	app-arch/unzip
"
DEPEND="
	${RDEPEND}
	test? (
		dev-java/junit:4
	)
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
	kotlin-daemon-client-new.jar
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
	kotlin-source-sections-compiler-plugin.jar
	kotlinx-serialization-compiler-plugin.jar
	mutability-annotations-compat.jar
	noarg-compiler-plugin.jar
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
	cp "${KOTLINC_LIBS[@]/#/lib/}" "${KOTLINC_LIB_TMP}" || die
	java-pkg_jar-from --into "${KOTLINC_LIB_TMP}" \
		"kotlin-common-bin-${KOTLIN_LIB_SLOT}"
	java-pkg_jar-from --into "${KOTLINC_LIB_TMP}" \
		"jetbrains-annotations-${JB_ANNOTATIONS_SLOT}" \
		jetbrains-annotations.jar annotations-13.0.jar
	java-pkg_jar-from --into "${KOTLINC_LIB_TMP}" \
		"jetbrains-trove" \
		jetbrains-trove.jar trove4j.jar
}

my_kotlinc() {
	"${KOTLINC_BIN_TMP}/kotlinc" -jvm-target "$(java-pkg_get-target)" "$@" \
		|| die
}

run_sample_tests() {
	cd "${STDLIB_S}/samples/test" || die

	# All sample files except _sampleUtils.kt,
	# the utility class used to support the samples
	local samples=( $(find * -mindepth 2 -name "*.kt") )

	ebegin "Compiling samples"
	# Compile the utility class which is used by all classes in the samples
	my_kotlinc -cp "${CP}" samples/_sampleUtils.kt
	# See libraries/stdlib/samples/build.gradle under Kotlin source tree for
	# compiler arguments
	my_kotlinc -cp "${CP}" \
		-Xuse-experimental=kotlin.ExperimentalStdlibApi \
		-Xuse-experimental=kotlin.ExperimentalUnsignedTypes \
		-Xuse-experimental=kotlin.time.ExperimentalTime \
		"${samples[@]}"

	ebegin "Running tests from samples"
	local TESTS=$(find * -mindepth 2 -name "*.class" \
		-not -name "*\$*.class" -not -name "*Kt.class")
	TESTS="${TESTS//.class}"
	TESTS="${TESTS//\//.}"
	ejunit4 -cp "${CP}" ${TESTS}
}

run_module_tests() {
	cd "${STDLIB_S}" || die

	local skipped_classes=(
		# JavaScript tests, which cannot be run on JVM
		test/js/*
		# Test that requires Kotlin Native
		test/random/RandomTest.kt
		# Failing tests
		jvm/test/utils/AssertionsJVMTest.kt
	)
	if has network-sandbox ${FEATURES}; then
		einfo "Skipping classes with test cases that require network connection"
		einfo "due to FEATURES=network-sandbox"
		skipped_classes+=( jvm/test/io/ReadWrite.kt )
	fi
	rm "${skipped_classes[@]}" || die

	local common_sources=( $(find {.,common}/test -name "*.kt") )
	local test_sources=( $(find {.,common,jvm}/test -name "*.kt") )

	local OLD_IFS="${IFS}"
	IFS=','
	local common_sources_val="${common_sources[*]}"
	IFS="${OLD_IFS}"

	ebegin "Compiling module tests"
	JAVA_OPTS="-Xmx768M" my_kotlinc -cp "${CP}" \
		-Xmulti-platform \
		-Xopt-in=kotlin.RequiresOptIn \
		-Xuse-experimental=kotlin.ExperimentalStdlibApi \
		-Xuse-experimental=kotlin.ExperimentalUnsignedTypes \
		-Xuse-experimental=kotlin.time.ExperimentalTime \
		-Xcommon-sources="${common_sources_val}" \
		"${test_sources[@]}"

	ebegin "Running module tests"
	local TESTS=$(find * -name "*Test.class")
	TESTS="${TESTS//.class}"
	TESTS="${TESTS//\//.}"
	ejunit4 -cp "${CP}" ${TESTS}
}

src_test() {
	local STDLIB_S="${WORKDIR}/kotlin-${PV}/libraries/stdlib"
	local CP=".:$(java-pkg_getjars \
		"kotlin-common-bin-${KOTLIN_LIB_SLOT},junit-4")"
	run_sample_tests
	run_module_tests
}

src_install() {
	into "${KOTLIN_COMPILER_HOME}"
	dobin "${KOTLINC_BIN_TMP}"/*

	insinto "${KOTLIN_COMPILER_HOME}/lib"
	doins "${KOTLINC_LIB_TMP}"/*

	# Remove redundant copy of Apache-2.0 license
	rm license/LICENSE.txt
	dodoc -r license/*

	# build.txt required for 'kotlin -version'
	insinto "${KOTLIN_COMPILER_HOME}"
	doins build.txt
}
