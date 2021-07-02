# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="org.jetbrains.kotlin:${PN}:${PV}"

KOTLIN_LIBS_BINJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}.jar"
KOTLIN_LIBS_SRCJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}-sources.jar"
KOTLIN_LIBS_TESTING_FRAMEWORKS="junit-4"

inherit kotlin-libs

DESCRIPTION="Kotlin Standard Library JDK 7 extension"
KEYWORDS="~amd64"

CP_DEPEND="
	~dev-java/kotlin-stdlib-${PV}:${SLOT}
"
DEPEND="
	${CP_DEPEND}
	!binary? (
		dev-java/jetbrains-annotations:13
	)
	test? (
		~dev-java/kotlin-test-annotations-common-${PV}:${SLOT}
		~dev-java/kotlin-test-${PV}:${SLOT}
		~dev-java/kotlin-test-junit-${PV}:${SLOT}
		dev-java/jetbrains-annotations:13
	)
"
RDEPEND="${CP_DEPEND}"

JAVA_CLASSPATH_EXTRA="jetbrains-annotations-13"
JAVA_TEST_GENTOO_CLASSPATH="
	kotlin-test-annotations-common-${SLOT}
	kotlin-test-${SLOT}
	kotlin-test-junit-${SLOT}
"
JAVA_BINJAR_FILENAME="${P}.jar"

KOTLIN_LIBS_RUNTIME_COMPONENT="Main"
KOTLIN_LIBS_KOTLINC_ARGS=(
	-jvm-target 1.6
	-no-stdlib
	-Xallow-kotlin-package
	-Xallow-no-source-files
	-Xjvm-default=compatibility
	-Xmultifile-parts-inherit
	-Xnormalize-constructor-calls=enable
	-Xopt-in=kotlin.RequiresOptIn
	-Xopt-in=kotlin.contracts.ExperimentalContracts
	-Xsuppress-deprecated-jvm-target-warning
	-Xuse-old-backend
)
KOTLIN_LIBS_SRC_DIR=( libraries/stdlib/jdk7/src )

KOTLIN_LIBS_TEST_KOTLINC_ARGS=(
	-jvm-target 1.6
	-no-stdlib
	-Xallow-kotlin-package
	-Xallow-no-source-files
	-Xfriend-paths="${JAVA_JAR_FILENAME}"
	-Xjvm-default=compatibility
	-Xmulti-platform
	-Xopt-in=kotlin.ExperimentalStdlibApi
	-Xopt-in=kotlin.ExperimentalUnsignedTypes
	-Xopt-in=kotlin.RequiresOptIn
	-Xopt-in=kotlin.io.path.ExperimentalPathApi
	-Xsuppress-deprecated-jvm-target-warning
	-Xuse-old-backend
)
KOTLIN_LIBS_TEST_COMMON_SOURCES_DIR=( libraries/stdlib/test )
KOTLIN_LIBS_TEST_SRC_DIR=(
	libraries/stdlib/{jdk7,jvm,common}/test
	# libraries/stdlib//test does not work
	libraries/stdlib/test
)
JAVA_TEST_EXCLUDES=(
	# Non-tests
	test.coroutines.TestDispatcher
	test.collections.IterableTests
	test.collections.OrderedIterableTests
	# Test that requires Kotlin Native
	test.random.RandomSmokeTest
	# JavaScript tests, having trouble with passing on JVM
	test.collections.js.SetJsTest
	test.collections.js.MapJsTest
	# Failing tests
	test.utils.AssertionsJVMTest
)

src_test() {
	if has network-sandbox ${FEATURES}; then
		elog "Skipping classes with test cases that require network connection"
		elog "due to FEATURES=network-sandbox"
		JAVA_TEST_EXCLUDES+=( test.io.ReadWriteTest )
	fi
	kotlin-libs_src_test
}
