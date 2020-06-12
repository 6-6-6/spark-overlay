# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-3.2.10.Final.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/netty/netty/3.2.10.Final/netty-3.2.10.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild netty-3.2.10.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Netty project is an effort to provide an asynchronous event-driven
    network application framework and tools for rapid development of
    maintainable high performance and high scalability protocol servers and
    clients.  In other words, Netty is a NIO client server framework which
    enables quick and easy development of network applications such as protocol
    servers and clients. It greatly simplifies and streamlines network
    programming such as TCP and UDP socket server."
HOMEPAGE="http://www.jboss.org/netty/"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/${PN}/${PN}/${PV}.Final/${P}.Final-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.netty:netty:3.2.10.Final"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# com.google.protobuf:protobuf-java:2.4.1 -> >=app-maven/protobuf-java-3.12.2:0
# commons-logging:commons-logging:1.1.1 -> >=dev-java/commons-logging-1.2:0
# javax.servlet:servlet-api:2.5 -> >=java-virtuals/servlet-api-2.3:2.3
# log4j:log4j:1.2.16 -> >=dev-java/log4j-1.2.17:0
# org.apache.felix:org.osgi.compendium:1.4.0 -> >=app-maven/org-osgi-compendium-1.4.0:0
# org.apache.felix:org.osgi.core:1.4.0 -> >=app-maven/osgi-core-1.4.0:1
# org.jboss.logging:jboss-logging-spi:2.1.2.GA -> >=app-maven/jboss-logging-spi-2.2.0:0
# org.slf4j:slf4j-api:1.6.4 -> >=dev-java/slf4j-simple-1.7.7:0

CDEPEND="
	>=app-maven/jboss-logging-spi-2.2.0:0
	>=app-maven/org-osgi-compendium-1.4.0:0
	>=app-maven/osgi-core-1.4.0:1
	>=app-maven/protobuf-java-3.12.2:0
	>=dev-java/commons-logging-1.2:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/slf4j-simple-1.7.7:0
	>=java-virtuals/servlet-api-2.3:2.3
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

JAVA_GENTOO_CLASSPATH="protobuf-java,commons-logging,servlet-api-2.3,log4j,org-osgi-compendium,osgi-core-1,jboss-logging-spi,slf4j-simple"
