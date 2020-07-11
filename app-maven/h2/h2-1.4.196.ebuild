# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/h2-1.4.196.pom --download-uri https://repo1.maven.org/maven2/com/h2database/h2/1.4.196/h2-1.4.196-sources.jar --slot 0 --keywords "~amd64" --ebuild h2-1.4.196.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="H2 Database Engine"
HOMEPAGE="http://www.h2database.com"
SRC_URI="https://repo1.maven.org/maven2/com/${PN}database/${PN}/${PV}/${P}-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/com/${PN}database/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.h2database:h2:1.4.200"

CDEPEND="
	app-maven/lucene-queryparser:3.6
	dev-java/jts-core:0
	dev-java/lucene:3.6
	dev-java/osgi-framework:6
	dev-java/osgi-service-jdbc:0
	dev-java/slf4j-api:0
	java-virtuals/servlet-api:3.0
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

JAVA_GENTOO_CLASSPATH="lucene-3.6,lucene-queryparser-3.6,osgi-framework-6,servlet-api-3.0,jts-core,slf4j-api,osgi-service-jdbc"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
