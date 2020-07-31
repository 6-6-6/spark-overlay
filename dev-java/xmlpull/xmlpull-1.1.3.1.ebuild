# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/xmlpull-1.1.3.1.pom --download-uri https://repo1.maven.org/maven2/xmlpull/xmlpull/1.1.3.1/xmlpull-1.1.3.1.jar --slot 0 --keywords "~amd64" --ebuild xmlpull-1.1.3.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION=""
HOMEPAGE="http://www.xmlpull.org"
SRC_URI="https://repo1.maven.org/maven2/${PN}/${PN}/${PV}/${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="xmlpull:xmlpull:1.1.3.1"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
