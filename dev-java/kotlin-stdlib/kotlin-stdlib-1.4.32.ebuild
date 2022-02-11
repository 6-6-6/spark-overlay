# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

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
		~dev-java/kotlin-coroutines-experimental-compat-${PV}:${SLOT}
		~dev-java/kotlin-test-${PV}:${SLOT}
		~dev-java/kotlin-test-junit-${PV}:${SLOT}
		dev-java/jetbrains-annotations:13
	)
"

JAVA_CLASSPATH_EXTRA="jetbrains-annotations-13"
JAVA_TEST_GENTOO_CLASSPATH="
	kotlin-coroutines-experimental-compat-${SLOT}
	kotlin-test-${SLOT}
	kotlin-test-junit-${SLOT}
"
JAVA_BINJAR_FILENAME="${P}.jar"
KOTLIN_LIBS_SRCJAR_FILENAME="${P}-sources.jar"

KOTLIN_LIBS_RUNTIME_COMPONENT="Main"
KOTLIN_KOTLINC_ARGS=(
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
	-Xuse-14-inline-classes-mangling-scheme
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
)

JAVA_TEST_EXTRA_ARGS=( -ea )
KOTLIN_TEST_KOTLINC_ARGS=(
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
	if ! has binary ${JAVA_PKG_IUSE} || ! use binary; then
		JAVA_CLASSPATH_EXTRA+=" kotlin-core-builtins-${SLOT}"
	fi
}

src_unpack() {
	kotlin-libs_src_unpack
	if ! has binary ${JAVA_PKG_IUSE} || ! use binary; then
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
