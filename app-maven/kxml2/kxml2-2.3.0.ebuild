# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/kxml2-2.3.0.pom --download-uri https://repo.maven.apache.org/maven2/net/sf/kxml/kxml2/2.3.0/kxml2-2.3.0-sources.jar --slot 0 --keywords "~amd64" --ebuild kxml2-2.3.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="kXML is a small XML pull parser, specially designed for constrained environments such as Applets, Personal Java or MIDP devices. In contrast to kXML 1, kXML 2 is based on the common XML pull API."
HOMEPAGE="http://kxml.sourceforge.net/"
SRC_URI="https://repo.maven.apache.org/maven2/net/sf/kxml/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="net.sf.kxml:kxml2:2.3.0"
MAVEN_PROVIDE="net.sf.kxml:kxml2-min:2.3.0"

CDEPEND="
	app-maven/xmlpull"

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

JAVA_GENTOO_CLASSPATH="xmlpull"
