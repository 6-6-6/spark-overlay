# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source binary test"
MAVEN_ID="net.sf.ehcache:${PN}:${PV}"
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

CP_DEPEND="
	>=dev-java/slf4j-api-1.7.7:0

	java-virtuals/ws-rs-api:0
	dev-java/jta:0
	dev-java/quartz:0
	dev-java/jersey-server:2
	dev-java/jersey-media-sse:2
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_NEEDS_TOOLS=1
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
