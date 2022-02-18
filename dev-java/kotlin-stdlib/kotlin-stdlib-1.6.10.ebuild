# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MAVEN_PROVIDES="
	org.jetbrains.kotlin:${PN}:${PV}
	org.jetbrains.kotlin:${PN}-common:${PV}
"

KOTLIN_LIBS_BINJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}.jar"
KOTLIN_LIBS_SRCJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}-sources.jar"
KOTLIN_TESTING_FRAMEWORKS="junit-4"

inherit kotlin-libs

DESCRIPTION="Kotlin Standard Library for JVM"
KEYWORDS="~amd64"

BDEPEND="
	!binary? (
		app-arch/unzip
	)
"

DEPEND="
	!binary? (
		dev-java/jetbrains-annotations:13
		~dev-java/kotlin-core-builtins-${PV}:${SLOT}
	)
	test? (
		~dev-java/kotlin-test-junit-${PV}:${SLOT}
		dev-java/jetbrains-annotations:13
	)
"

JAVA_CLASSPATH_EXTRA="jetbrains-annotations-13"
JAVA_TEST_GENTOO_CLASSPATH="kotlin-test-junit-${SLOT}"
JAVA_BINJAR_FILENAME="${P}.jar"
KOTLIN_LIBS_SRCJAR_FILENAME="${P}-sources.jar"

KOTLIN_COMMON_KOTLINC_ARGS=(
	-jvm-target 1.6
	-no-stdlib
	-Xallow-no-source-files
	-Xmulti-platform
	-Xopt-in=kotlin.RequiresOptIn
	-Xsuppress-deprecated-jvm-target-warning
)

KOTLIN_LIBS_RUNTIME_COMPONENT="Main"
KOTLIN_KOTLINC_ARGS=(
	"${KOTLIN_COMMON_KOTLINC_ARGS[@]}"
	-Xallow-kotlin-package
	-Xmultifile-parts-inherit
	-Xuse-14-inline-classes-mangling-scheme
	-Xopt-in=kotlin.ExperimentalMultiplatform
	-Xopt-in=kotlin.contracts.ExperimentalContracts
)
KOTLIN_JAVA_SOURCE_ROOTS=( libraries/stdlib/jvm/{src,runtime} )
KOTLIN_COMMON_SOURCES_DIR=( libraries/stdlib/{,common,unsigned}/src )
KOTLIN_SRC_DIR=(
	core/builtins/src
	libraries/stdlib/jvm/runtime
	libraries/stdlib/{,common,jvm,unsigned}/src
)
KOTLIN_JAVAC_ARGS=(
	-g
	-proc:none
	-XDuseUnsharedTable=true
	-Xlint:deprecation
	-Xlint:unchecked
)

JAVA_TEST_EXTRA_ARGS=( -ea )
KOTLIN_TEST_KOTLINC_ARGS=(
	"${KOTLIN_COMMON_KOTLINC_ARGS[@]}"
	-Xfriend-paths="${JAVA_JAR_FILENAME}"
	-Xjvm-default=compatibility
	-Xno-kotlin-nothing-value-exception
	-Xsuppress-deprecated-jvm-target-warning
	-Xopt-in=kotlin.ExperimentalStdlibApi
	-Xopt-in=kotlin.ExperimentalUnsignedTypes
)
KOTLIN_TEST_COMMON_SOURCES_DIR=(
	libraries/stdlib/{,common}/test
)
KOTLIN_TEST_SRC_DIR=(
	libraries/stdlib/{,jvm,common}/test
)
KOTLIN_TEST_EXCLUDES=(
	# Non-tests
	test.coroutines.TestDispatcher
	test.collections.IterableTests
	test.collections.OrderedIterableTests
	# Test that requires Kotlin Native
	test.random.RandomSmokeTest
	# JavaScript tests, having trouble with passing on JVM
	test.collections.js.SetJsTest
	test.collections.js.MapJsTest
)

pkg_setup() {
	kotlin-libs_pkg_setup
	# Some Java SE API members used by this package are deprecated
	# on Java 11+, so deprecation warnings are expected
	if [[ "$(java-config -g PROVIDES_VERSION)" == 1.8 ]]; then
		KOTLIN_KOTLINC_ARGS+=( -Werror )
	fi
	if ! in_iuse binary || ! use binary; then
		JAVA_CLASSPATH_EXTRA+=" kotlin-core-builtins-${SLOT}"
	fi
}

src_unpack() {
	kotlin-libs_src_unpack
	if ! in_iuse binary || ! use binary; then
		unpack "$(java-pkg_getjar --build-only \
			"kotlin-core-builtins-${SLOT}" kotlin-core-builtins.jar)"
		mkdir -p "${S}/${KOTLIN_UTILS_CLASSES}" || \
			die "Failed to create target directory for compiler output"
		mv kotlin "${S}/${KOTLIN_UTILS_CLASSES}" || \
			die "Failed to move built-ins to target directory"
	fi
}

src_prepare() {
	if use test && has network-sandbox ${FEATURES}; then
		elog "Skipping test cases that require network connection"
		elog "due to FEATURES=network-sandbox"
		eapply "${FILESDIR}/kotlin-1.4-skip-internet-tests.patch"
	fi
	eapply_user
}
