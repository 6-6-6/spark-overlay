# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/charts4j-1.3.pom --download-uri https://repo1.maven.org/maven2/com/googlecode/charts4j/charts4j/1.3/charts4j-1.3-sources.jar --slot 0 --keywords "~amd64" --ebuild charts4j-1.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="charts4j is a free, lightweight charts and graphs Java API. It enables developers to programmatically create the charts available in the Google Chart API through a straightforward and intuitive Java API."
HOMEPAGE="http://charts4j.googlecode.com"
SRC_URI="https://repo1.maven.org/maven2/com/googlecode/${PN}/${PN}/${PV}/${P}-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/com/googlecode/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.googlecode.charts4j:charts4j:1.3"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
