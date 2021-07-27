# Copyright 2021 Gentoo Authors
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

DESCRIPTION="Kotlin Test Multiplatform library"
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

KOTLIN_LIBS_RUNTIME_COMPONENT="Test"
KOTLIN_KOTLINC_ARGS=(
	-jvm-target 1.6
	-no-stdlib
	-Xallow-kotlin-package
	-Xallow-no-source-files
	-Xjvm-default=compatibility
	-Xmulti-platform
	-Xnormalize-constructor-calls=enable
	-Xopt-in=kotlin.RequiresOptIn
	-Xopt-in=kotlin.contracts.ExperimentalContracts
)
KOTLIN_COMMON_SOURCES_DIR=( libraries/kotlin.test/common/src/main/kotlin )
KOTLIN_SRC_DIR=( libraries/kotlin.test/{common,jvm}/src/main/kotlin )

KOTLIN_TEST_KOTLINC_ARGS=(
	-jvm-target 1.6
	-no-stdlib
	-Xallow-kotlin-package
	-Xallow-no-source-files
	-Xfriend-paths="${JAVA_JAR_FILENAME}"
	-Xjvm-default=compatibility
	-Xopt-in=kotlin.RequiresOptIn
	-Xmulti-platform
)
KOTLIN_TEST_COMMON_SOURCES_DIR=(
	libraries/kotlin.test/common/src/test/kotlin
)
KOTLIN_TEST_SRC_DIR=(
	libraries/kotlin.test/{jvm,common}/src/test/kotlin
)
