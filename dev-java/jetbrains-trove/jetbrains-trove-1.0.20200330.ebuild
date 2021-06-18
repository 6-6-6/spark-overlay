# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jetbrains.intellij.deps:trove4j:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN="trove4j"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Fork of trove4j library used in IntelliJ Platform"
HOMEPAGE="https://github.com/JetBrains/intellij-deps-trove4j"
SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/intellij/deps/${MY_PN}/${PV}/${MY_P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jetbrains/intellij/deps/${MY_PN}/${PV}/${MY_P}.jar -> ${P}-bin.jar"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

BDEPEND="app-arch/unzip"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
