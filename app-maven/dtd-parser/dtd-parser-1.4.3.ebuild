# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/dtd-parser-1.4.3.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/xml/dtd-parser/dtd-parser/1.4.3/dtd-parser-1.4.3-sources.jar --slot 0 --keywords "~amd64" --ebuild dtd-parser-1.4.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="SAX-like API for parsing XML DTDs."
HOMEPAGE="https://github.com/eclipse-ee4j/jaxb-dtd-parser"
SRC_URI="https://repo.maven.apache.org/maven2/com/sun/xml/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.xml.dtd-parser:dtd-parser:1.4.3"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

