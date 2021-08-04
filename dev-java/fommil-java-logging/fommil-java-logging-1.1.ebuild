# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.github.fommil:java-logging:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN="java-logging"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A variety of java.util.logging formatters, adapters and filters"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="
	https://repo1.maven.org/maven2/com/github/fommil/${MY_PN}/${PV}/${MY_P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/github/fommil/${MY_PN}/${PV}/${MY_P}.jar -> ${P}-bin.jar
"
LICENSE="LGPL-3"
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
	dev-java/jcl-over-slf4j:0
	dev-java/log4j-over-slf4j:0
	dev-java/slf4j-api:0
	dev-java/slf4j-jdk14:0
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_install() {
	java-pkg-simple_src_install
	java-pkg_register-dependency \
		"jcl-over-slf4j,log4j-over-slf4j,slf4j-api,slf4j-jdk14"
}
