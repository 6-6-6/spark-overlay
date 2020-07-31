# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/xmlenc-0.52.pom --download-uri https://repo1.maven.org/maven2/xmlenc/xmlenc/0.52/xmlenc-0.52.jar --slot 0 --keywords "~amd64" --ebuild xmlenc-0.52.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="xmlenc Library"
HOMEPAGE="http://xmlenc.sourceforge.net"
SRC_URI="https://repo1.maven.org/maven2/${PN}/${PN}/${PV}/${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="xmlenc:xmlenc:0.52"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
