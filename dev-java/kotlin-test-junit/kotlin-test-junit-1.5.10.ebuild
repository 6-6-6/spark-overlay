# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="org.jetbrains.kotlin:${PN}:${PV}"

KOTLIN_LIBS_BINJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}.jar"
KOTLIN_LIBS_SRCJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}-sources.jar"
KOTLIN_LIBS_TESTING_FRAMEWORKS="junit-4"

inherit kotlin-libs

DESCRIPTION="Kotlin Test Support for JUnit 4"
KEYWORDS="~amd64"

CP_DEPEND="
	~dev-java/kotlin-stdlib-${PV}:${SLOT}
	~dev-java/kotlin-test-${PV}:${SLOT}
	dev-java/junit:4
"
DEPEND="
	${CP_DEPEND}
	!binary? (
		dev-java/jetbrains-annotations:13
	)
	test? (
		dev-java/jetbrains-annotations:13
		~dev-java/kotlin-test-annotations-common-${PV}:${SLOT}
	)
"
RDEPEND="${CP_DEPEND}"

JAVA_CLASSPATH_EXTRA="jetbrains-annotations-13"
JAVA_BINJAR_FILENAME="${P}.jar"
JAVA_RESOURCE_DIRS=( libraries/kotlin.test/junit/src/main/resources )

KOTLIN_LIBS_RUNTIME_COMPONENT="Test"
KOTLIN_LIBS_KOTLINC_ARGS=(
	-jvm-target 1.6
	-no-stdlib
	-Xallow-kotlin-package
	-Xallow-no-source-files
	-Xjvm-default=compatibility
	-Xmulti-platform
	-Xsuppress-deprecated-jvm-target-warning
	-Xuse-old-backend
)
KOTLIN_LIBS_COMMON_SOURCES_DIR=(
	libraries/kotlin.test/annotations-common/src/main/kotlin
)
KOTLIN_LIBS_SRC_DIR=(
	libraries/kotlin.test/junit/src/main/kotlin
	libraries/kotlin.test/annotations-common/src/main/kotlin
)

KOTLIN_LIBS_TEST_KOTLINC_ARGS=(
	-jvm-target 1.6
	-no-stdlib
	-Xallow-kotlin-package
	-Xallow-no-source-files
	-Xfriend-paths="${JAVA_JAR_FILENAME}"
	-Xjvm-default=compatibility
	-Xmulti-platform
	-Xsuppress-deprecated-jvm-target-warning
	-Xuse-old-backend
)
KOTLIN_LIBS_TEST_COMMON_SOURCES_DIR=(
	libraries/kotlin.test/annotations-common/src/test/kotlin
)
KOTLIN_LIBS_TEST_SRC_DIR=(
	libraries/kotlin.test/{junit,annotations-common}/src/test/kotlin
)
