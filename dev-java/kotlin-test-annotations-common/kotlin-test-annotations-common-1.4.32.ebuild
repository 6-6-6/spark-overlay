# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="org.jetbrains.kotlin:${PN}:${PV}"

KOTLIN_LIBS_BINJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}.jar"
KOTLIN_LIBS_SRCJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}-sources.jar"

inherit kotlin-libs

DESCRIPTION="Common Annotations for Kotlin Test"
KEYWORDS="~amd64"

JAVA_BINJAR_FILENAME="${P}.jar"
KOTLIN_LIBS_SRCJAR_FILENAME="${P}-sources.jar"

KOTLIN_LIBS_RUNTIME_COMPONENT="Test"
KOTLIN_LIBS_KOTLINC_ARGS=(
	-Xallow-kotlin-package
	-Xmulti-platform
	-Xopt-in=kotlin.RequiresOptIn
	-Xread-deserialized-contracts
)
KOTLIN_LIBS_SRC_DIR=( libraries/kotlin.test/annotations-common/src/main/kotlin )

src_compile() {
	export KOTLIN_COMPILER=org.jetbrains.kotlin.cli.metadata.K2MetadataCompiler
	kotlin-libs_src_compile
	unset KOTLIN_COMPILER
}
