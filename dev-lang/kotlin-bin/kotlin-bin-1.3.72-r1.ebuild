# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit java-pkg-2

DESCRIPTION="Statically typed programming language for modern multiplatform applications"
HOMEPAGE="https://kotlinlang.org/"
SRC_URI="
	https://github.com/JetBrains/kotlin/releases/download/v${PV}/kotlin-compiler-${PV}.zip
	test? (
		https://github.com/JetBrains/kotlin/archive/refs/tags/v${PV}.tar.gz -> kotlin-${PV}.tar.gz
	)
"

LICENSE="Apache-2.0 BSD MIT NPL-1.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

KOTLIN_LIB_SLOT="${PV%.*}"
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
	my_kotlinc -cp "${CP}" \
		-Xuse-experimental=kotlin.ExperimentalStdlibApi \
		-Xuse-experimental=kotlin.time.ExperimentalTime \
		"${samples[@]}"

	ebegin "Running tests from samples"
	local TESTS=$(find * -mindepth 2 -name "*.class" \
		-not -name "*\$*.class" -not -name "*Kt.class")
	TESTS="${TESTS//.class}"
	TESTS="${TESTS//\//.}"
	ejunit4 -cp "${CP}" ${TESTS}
}

# This test does not work yet
run_module_tests() {
	cd "${STDLIB_S}" || die

	# All module tests except testUtils.kt
	local test_sources=( $(find test -mindepth 2 -name "*.kt") )

	ebegin "Compiling module tests"
	# Compile the utility class first
	my_kotlinc -cp "${CP}" test/testUtils.kt
	JAVA_OPTS="-Xmx768M" my_kotlinc -cp "${CP}" \
		-Xuse-experimental=kotlin.ExperimentalStdlibApi \
		"${test_sources[@]}"

	ebegin "Running module tests"
	local TESTS=$(find * -mindepth 2 -name "*.class" \
		-not -name "*\$*.class" -not -name "*Kt.class")
	TESTS="${TESTS//.class}"
	TESTS="${TESTS//\//.}"
	ejunit4 -cp "${CP}" ${TESTS}
}

src_test() {
	local STDLIB_S="${WORKDIR}/kotlin-${PV}/libraries/stdlib"
	local CP=".:$(java-pkg_getjars \
		"kotlin-common-bin-${KOTLIN_LIB_SLOT},junit-4")"
	run_sample_tests
}

src_install() {
	local kotlin_home="/opt/${PN}"

	into "${kotlin_home}"
	for exe in "${KOTLINC_BIN_TMP}"/*; do
		dobin "${exe}"
		local basename=$(basename "${exe}" || die)
		dosym "../../${kotlin_home}/bin/${basename}" "/usr/bin/${basename}"
	done

	insinto "${kotlin_home}/lib"
	doins "${KOTLINC_LIB_TMP}"/*

	dodoc -r license/*
}

get_kotlin_lib_atom_slot() {
	echo $(ver_cut 1-2 "${1/#${kotlin_lib_pkg}-/}")
}

pkg_postinst() {
	local kotlin_lib_PN="kotlin-common-bin"
	local kotlin_lib_pkg="dev-java/${kotlin_lib_PN}"
	local kotlin_lib_ver=$(best_version "${kotlin_lib_pkg}:${KOTLIN_LIB_SLOT}")
	local any_newer_ver=$(best_version ">${kotlin_lib_ver}")
	local any_older_ver=$(best_version "<${kotlin_lib_ver}")

	if [[ -n "${any_newer_ver}" ]]; then
		local newer_slot=$(get_kotlin_lib_atom_slot "${any_newer_ver}")
		local newer_pkg="${kotlin_lib_PN}-${newer_slot}"
		elog "The following version of ${kotlin_lib_pkg} for"
		elog "Kotlin feature release newer than ${KOTLIN_LIB_SLOT} is found:"
		elog "	${any_newer_ver}"
		elog
		elog "To use this version of Kotlin libraries, please invoke kotlinc"
		elog "using a command with options like the following:"
		elog "	kotlinc -classpath \"\$(java-config -p ${newer_pkg})\" \\"
		elog "		-no-stdlib"
	fi

	# Print some empty lines only if necessary
	if [[ -n "${any_newer_ver}" && -n "${any_older_ver}" ]]; then
		elog
		elog
	fi

	if [[ -n "${any_older_ver}" ]]; then
		local older_slot=$(get_kotlin_lib_atom_slot "${any_older_ver}")
		local older_pkg="${kotlin_lib_PN}-${older_slot}"
		elog "The following version of ${kotlin_lib_pkg} for"
		elog "Kotlin feature release older than ${KOTLIN_LIB_SLOT} is found:"
		elog "	${any_older_ver}"
		elog
		elog "To use this version of Kotlin libraries, please invoke kotlinc"
		elog "using a command with options like the following:"
		elog "	kotlinc -classpath \"\$(java-config -p ${older_pkg})\" \\"
		elog "		-api-version ${older_slot} \\"
		elog "		-no-stdlib"
	fi
}
