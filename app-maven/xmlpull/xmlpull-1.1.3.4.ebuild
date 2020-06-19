# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/xmlpull-1.1.3.4a.pom --download-uri https://repo.maven.apache.org/maven2/xmlpull/xmlpull/1.1.3.4a/xmlpull-1.1.3.4a.jar --slot 0 --keywords "~amd64" --ebuild xmlpull-1.1.3.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION=""
HOMEPAGE="http://www.xmlpull.org"
SRC_URI="https://repo.maven.apache.org/maven2/${PN}/${PN}/${PV}a/${P}a.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="xmlpull:xmlpull:1.1.3.4a"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

