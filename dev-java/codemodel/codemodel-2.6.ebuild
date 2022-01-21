# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.sun.codemodel:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The core functionality of the CodeModel java source code generation library"
HOMEPAGE="https://codemodel.java.net/codemodel/"
SRC_URI="
	https://repo1.maven.org/maven2/com/sun/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/sun/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="CDDL-1.1 GPL-2"
SLOT="2"
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
