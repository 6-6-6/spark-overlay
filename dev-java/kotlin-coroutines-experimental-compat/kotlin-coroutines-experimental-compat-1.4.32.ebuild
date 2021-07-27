# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="org.jetbrains.kotlin:${PN}:${PV}"

KOTLIN_LIBS_BINJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}.jar"
KOTLIN_LIBS_SRCJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}-sources.jar"
KOTLIN_TESTING_FRAMEWORKS="junit-4"

inherit kotlin-libs

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
		~dev-java/kotlin-test-${PV}:${SLOT}
		~dev-java/kotlin-test-junit-${PV}:${SLOT}
		dev-java/jetbrains-annotations:13
		virtual/kotlin:1.4
	)
"
RDEPEND="${CP_DEPEND}"

JAVA_CLASSPATH_EXTRA="jetbrains-annotations-13"
JAVA_TEST_GENTOO_CLASSPATH="
	kotlin-test-${SLOT}
	kotlin-test-junit-${SLOT}
"
JAVA_BINJAR_FILENAME="${P}.jar"
KOTLIN_LIBS_SRCJAR_FILENAME="${P}-sources.jar"

KOTLIN_LIBS_RUNTIME_COMPONENT="Main"
KOTLIN_WANT_TARGET="1.3"
KOTLIN_KOTLINC_ARGS=(
	-no-stdlib
	-Xallow-kotlin-package
	-Xcoroutines=enable
	-Xjvm-default=compatibility
	-Xmulti-platform
	-Xmultifile-parts-inherit
	-Xopt-in=kotlin.RequiresOptIn
	-Xopt-in=kotlin.contracts.ExperimentalContracts
	-Xuse-old-backend
	-XXLanguage:-ReleaseCoroutines
)
KOTLIN_SRC_DIR=(
	libraries/stdlib/coroutines-experimental/{,jvm}/src
)

KOTLIN_TEST_KOTLINC_ARGS=(
	-api-version 1.2
	-language-version 1.2
	-no-stdlib
	-Xallow-no-source-files
	-Xcoroutines=enable
	-Xfriend-paths="${JAVA_JAR_FILENAME}"
	-Xjvm-default=compatibility
	-Xuse-old-backend
)
KOTLIN_TEST_SRC_DIR=( libraries/stdlib/coroutines-experimental/jvm/test )
