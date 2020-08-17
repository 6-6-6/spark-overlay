# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/aalto-xml-1.0.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/fasterxml/aalto-xml/1.0.0/aalto-xml-1.0.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/fasterxml/aalto-xml/1.0.0/aalto-xml-1.0.0.jar --slot 0 --keywords "~amd64" --ebuild aalto-xml-1.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.fasterxml:aalto-xml:1.0.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Ultra-high performance non-blocking XML processor (Stax/Stax2, SAX/SAX2)"
HOMEPAGE="http://github.com/FasterXML/aalto-xml/"
SRC_URI="https://repo1.maven.org/maven2/com/fasterxml/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/fasterxml/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.woodstox:stax2-api:4.0.0 -> >=dev-java/stax2-api-4.0.0:0

CDEPEND="
	>=dev-java/stax2-api-4.0.0:0
"

DEPEND="
	virtual/jdk:1.8
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="stax2-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_prepare() {
	java-pkg-2_src_prepare
	rm ${JAVA_SRC_DIR}/{annotations,test} -r || die
}
