# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MAVEN_ID="org.jetbrains.kotlin:${PN}:${PV}"

KOTLIN_LIBS_BINJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}.jar"
KOTLIN_LIBS_SRCJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}-sources.jar"
KOTLIN_TESTING_FRAMEWORKS="junit-4"

inherit kotlin-libs

DESCRIPTION="Kotlin Standard Library JDK 7 extension"
KEYWORDS="~amd64"

CP_DEPEND="
	~dev-java/kotlin-stdlib-${PV}:${SLOT}
"
DEPEND="
	!binary? (
		${CP_DEPEND}
		dev-java/jetbrains-annotations:13
	)
	test? (
		${CP_DEPEND}
		~dev-java/kotlin-test-junit-${PV}:${SLOT}
		dev-java/jetbrains-annotations:13
	)
"
RDEPEND="${CP_DEPEND}"

JAVA_CLASSPATH_EXTRA="jetbrains-annotations-13"
JAVA_TEST_GENTOO_CLASSPATH="kotlin-test-junit-${SLOT}"
JAVA_BINJAR_FILENAME="${P}.jar"
KOTLIN_LIBS_SRCJAR_FILENAME="${P}-sources.jar"

KOTLIN_COMMON_KOTLINC_ARGS=(
	-jvm-target 1.6
	-no-stdlib
	-Xallow-kotlin-package
	-Xallow-no-source-files
	-Xjvm-default=compatibility
	-Xopt-in=kotlin.RequiresOptIn
	-Xsuppress-deprecated-jvm-target-warning
	-Xuse-old-backend
)

KOTLIN_LIBS_RUNTIME_COMPONENT="Main"
KOTLIN_KOTLINC_ARGS=(
	"${KOTLIN_COMMON_KOTLINC_ARGS[@]}"
	-Xmultifile-parts-inherit
	-Xnormalize-constructor-calls=enable
	-Xopt-in=kotlin.contracts.ExperimentalContracts
)
KOTLIN_SRC_DIR=( libraries/stdlib/jdk7/src )

JAVA_TEST_EXTRA_ARGS=( -ea )
KOTLIN_TEST_KOTLINC_ARGS=(
	"${KOTLIN_COMMON_KOTLINC_ARGS[@]}"
	-Xfriend-paths="${JAVA_JAR_FILENAME}"
	-Xmulti-platform
	-Xopt-in=kotlin.ExperimentalStdlibApi
	-Xopt-in=kotlin.ExperimentalUnsignedTypes
	-Xopt-in=kotlin.io.path.ExperimentalPathApi
)
KOTLIN_TEST_COMMON_SOURCES_DIR=( libraries/stdlib/test )
KOTLIN_TEST_SRC_DIR=(
	libraries/stdlib/{jdk7,jvm,common}/test
	# libraries/stdlib//test does not work
	libraries/stdlib/test
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

src_prepare() {
	if use test && has network-sandbox ${FEATURES}; then
		elog "Skipping test cases that require network connection"
		elog "due to FEATURES=network-sandbox"
		eapply "${FILESDIR}/kotlin-1.4-skip-internet-tests.patch"
	fi
	eapply_user
}
