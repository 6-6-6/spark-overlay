# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="org.jetbrains.kotlin:${PN}:${PV}"

KOTLIN_LIBS_BINJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}.jar"
KOTLIN_LIBS_SRCJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}-sources.jar"
KOTLIN_LIBS_TESTING_FRAMEWORKS="junit-4"

inherit kotlin-libs

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
		<dev-lang/kotlin-bin-1.5:0
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
	-api-version 1.3
	-language-version 1.3
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
KOTLIN_LIBS_SRC_DIR=(
	libraries/stdlib/coroutines-experimental/{,jvm}/src
)

KOTLIN_LIBS_TEST_KOTLINC_ARGS=(
	-api-version 1.2
	-language-version 1.2
	-no-stdlib
	-Xallow-no-source-files
	-Xcoroutines=enable
	-Xfriend-paths="${JAVA_JAR_FILENAME}"
	-Xjvm-default=compatibility
	-Xuse-old-backend
)
KOTLIN_LIBS_TEST_SRC_DIR=( libraries/stdlib/coroutines-experimental/jvm/test )
