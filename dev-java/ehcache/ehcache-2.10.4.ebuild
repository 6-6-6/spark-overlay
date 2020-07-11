# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/ehcache-2.10.4.pom --download-uri https://repo1.maven.org/maven2/net/sf/ehcache/ehcache/2.10.4/ehcache-2.10.4-sources.jar --slot 0 --keywords "~amd64" --ebuild ehcache-2.10.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Ehcache is an open source, standards-based cache used to boost performance,
  offload the database and simplify scalability. Ehcache is robust, proven and full-featured and
  this has made it the most widely-used Java-based cache."
HOMEPAGE="http://ehcache.org"
SRC_URI="https://repo1.maven.org/maven2/net/sf/${PN}/${PN}/${PV}/${P}-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/net/sf/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="net.sf.ehcache:ehcache:2.10.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.slf4j:slf4j-api:1.7.7 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/slf4j-api-1.7.7:0

	java-virtuals/ws-rs-api:0
	app-maven/jersey-server:0
	app-maven/jersey-media-sse:0
	java-virtuals/transaction-api:0
"


DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_NEEDS_TOOLS=1
JAVA_GENTOO_CLASSPATH="slf4j-api,ws-rs-api,jersey-server,jersey-media-sse,transaction-api"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
