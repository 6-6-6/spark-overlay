# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/xml-apis-1.0.b2.pom --download-uri https://repo1.maven.org/maven2/xml-apis/xml-apis/1.0.b2/xml-apis-1.0.b2-sources.jar --slot 0 --keywords "~amd64" --ebuild xml-apis-1.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="xml-commons provides an Apache-hosted set of DOM, SAX, and 
    JAXP interfaces for use in other xml-based projects. Our hope is that we 
    can standardize on both a common version and packaging scheme for these 
    critical XML standards interfaces to make the lives of both our developers 
    and users easier. The External Components portion of xml-commons contains 
    interfaces that are defined by external standards organizations. For DOM, 
    that's the W3C; for SAX it's David Megginson and sax.sourceforge.net; for 
    JAXP it's Sun."
HOMEPAGE="http://xml.apache.org/commons/#external"
SRC_URI="https://repo1.maven.org/maven2/${PN}/${PN}/${PV}.b2/${P}.b2-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/${PN}/${PN}/${PV}.b2/${P}.b2.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="xml-apis:xml-apis:1.0.b2"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

