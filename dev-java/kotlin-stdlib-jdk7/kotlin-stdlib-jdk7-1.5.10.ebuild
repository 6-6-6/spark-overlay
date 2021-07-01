# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="org.jetbrains.kotlin:${PN}:${PV}"

KOTLIN_LIBS_BINJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}.jar"
KOTLIN_LIBS_SRCJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}-sources.jar"

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
"
RDEPEND="${CP_DEPEND}"

JAVA_CLASSPATH_EXTRA="jetbrains-annotations-13"
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
