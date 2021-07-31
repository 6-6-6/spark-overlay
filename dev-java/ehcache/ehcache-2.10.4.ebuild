# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source binary test"
MAVEN_ID="net.sf.ehcache:ehcache:2.10.4"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Cache used to boost performance, offload database and simplify scalability"
HOMEPAGE="https://www.ehcache.org/"
SRC_URI="
	https://repo1.maven.org/maven2/net/sf/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/net/sf/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="2"
KEYWORDS="~amd64"

# JARs providing the following Java packages are needed:
# org.terracotta.toolkit.{builder,collection,concurrent,...}
# org.hibernate.{cache,config}
IUSE="+binary"

CDEPEND="
	>=dev-java/slf4j-api-1.7.7:0

	java-virtuals/ws-rs-api:0
	dev-java/quartz:0
	dev-java/jersey-server:2
	dev-java/jersey-media-sse:2
	java-virtuals/transaction-api:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
"

S="${WORKDIR}"

JAVA_NEEDS_TOOLS=1
JAVA_GENTOO_CLASSPATH="quartz,slf4j-api,ws-rs-api,jersey-server-2,jersey-media-sse-2,transaction-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
