# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-3.2.9.Final.pom --download-uri https://repo1.maven.org/maven2/org/jboss/netty/netty/3.2.9.Final/netty-3.2.9.Final-sources.jar --slot 3.2 --keywords "~amd64" --ebuild netty-3.2.9-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Netty project is an effort to provide an asynchronous event-driven
    network application framework and tools for rapid development of
    maintainable high performance and high scalability protocol servers and
    clients.  In other words, Netty is a NIO client server framework which
    enables quick and easy development of network applications such as protocol
    servers and clients. It greatly simplifies and streamlines network
    programming such as TCP and UDP socket server."
HOMEPAGE="http://www.jboss.org/netty/"
SRC_URI="https://repo1.maven.org/maven2/org/jboss/${PN}/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/${PN}/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="3.2"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.netty:netty:3.2.9.Final"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# com.google.protobuf:protobuf-java:2.4.1 -> >=dev-java/protobuf-java-3.11.4:0
# commons-logging:commons-logging:1.1.1 -> >=dev-java/commons-logging-1.2:0
# javax.servlet:servlet-api:2.5 -> java-virtuals/servlet-api:4.0
# log4j:log4j:1.2.16 -> >=dev-java/log4j-1.2.17:0
# org.apache.felix:org.osgi.compendium:1.4.0 -> >=dev-java/osgi-compendium-4.3.1:0
# org.apache.felix:org.osgi.core:1.4.0 -> >=dev-java/osgi-core-1.4.0:1
# org.jboss.logging:jboss-logging-spi:2.1.2.GA -> >=app-maven/jboss-logging-spi-2.1.2:0
# org.slf4j:slf4j-api:1.6.4 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=app-maven/jboss-logging-spi-2.1.2:0
	>=dev-java/commons-logging-1.2:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/osgi-compendium-4.3.1:0
	>=dev-java/osgi-core-1.4.0:1
	>=dev-java/protobuf-java-3.11.4:0
	>=dev-java/slf4j-api-1.7.7:0
	java-virtuals/servlet-api:4.0
"


DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="protobuf-java,commons-logging,servlet-4.0,log4j,osgi-compendium,osgi-core-1,jboss-logging-spi,slf4j-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
