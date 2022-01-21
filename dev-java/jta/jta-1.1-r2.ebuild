# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="javax.transaction:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The javax.transaction package"
HOMEPAGE="https://www.oracle.com/java/technologies/jta.html"
SRC_URI="
	https://repo1.maven.org/maven2/javax/transaction/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/javax/transaction/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="CDDL"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVADOC_ARGS="-source 8"
