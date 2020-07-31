# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/xml-resolver-1.2.pom --download-uri https://repo1.maven.org/maven2/xml-resolver/xml-resolver/1.2/xml-resolver-1.2-sources.jar --slot 0 --keywords "~amd64" --ebuild xml-resolver-1.2-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="xml-commons provides an Apache-hosted set of DOM, SAX, and 
    JAXP interfaces for use in other xml-based projects. Our hope is that we 
    can standardize on both a common version and packaging scheme for these 
    critical XML standards interfaces to make the lives of both our developers 
    and users easier."
HOMEPAGE="http://xml.apache.org/commons/components/resolver/"
SRC_URI="https://repo1.maven.org/maven2/${PN}/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="xml-resolver:xml-resolver:1.2"

CDEPEND="
	dev-java/junit:4
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="junit-4"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

