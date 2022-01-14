# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="net.java.dev.msv:msv-core:2013.6.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN="msv-core"
MY_PV="${PV:4:2}.${PV:6}"
MY_PV="${PV:0:4}.${MY_PV//0}"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="Multi-Schema XML Validator, a Java tool for validating XML documents"
HOMEPAGE="https://msv.java.net/"
SRC_URI="
	https://repo1.maven.org/maven2/net/java/dev/msv/${MY_PN}/${MY_PV}/${MY_P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/net/java/dev/msv/${MY_PN}/${MY_PV}/${MY_P}.jar -> ${P}-bin.jar
"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/iso-relax:0
	dev-java/relaxng-datatype:0
	dev-java/xml-commons-resolver:0
	dev-java/xsdlib:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
	dev-java/xerces:2
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVAC_ARGS="-XDignore.symbol.file"

JAVA_MAIN_CLASS="com.sun.msv.driver.textui.Driver"
JAVA_LAUNCHER_FILENAME="${PN}"

src_prepare() {
	eapply "${FILESDIR}/${P}-use-xml-commons-resolver.patch"
	java-pkg-2_src_prepare
}

src_install() {
	java-pkg-simple_src_install
	java-pkg_register-dependency xerces-2
}
