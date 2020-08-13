# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-all-4.1.42.Final.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/io/netty/netty-all/4.1.42.Final/netty-all-4.1.42.Final-sources.jar --binjar-uri https://repo1.maven.org/maven2/io/netty/netty-all/4.1.42.Final/netty-all-4.1.42.Final.jar --slot 0 --keywords "~amd64" --ebuild netty-all-4.1.42.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MAVEN_ID="io.netty:netty-all:4.1.42.Final"
DESCRIPTION="Netty is an asynchronous event-driven network application framework for rapid development of maintainable high performance protocol servers and clients."
HOMEPAGE="https://netty.io/netty-all/"
SRC_URI="https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar"
#https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# com.google.protobuf:protobuf-java:2.6.1 -> >=dev-java/protobuf-java-3.11.4:0
# commons-logging:commons-logging:1.2 -> >=dev-java/commons-logging-1.2:0
# io.netty:netty-buffer:4.1.42.Final -> >=dev-java/netty-buffer-4.1.42:0
# io.netty:netty-codec:4.1.42.Final -> >=dev-java/netty-codec-4.1.42:0
# io.netty:netty-codec-dns:4.1.42.Final -> >=dev-java/netty-codec-dns-4.1.42:0
# io.netty:netty-codec-haproxy:4.1.42.Final -> >=dev-java/netty-codec-haproxy-4.1.42:0
# io.netty:netty-codec-http:4.1.42.Final -> >=dev-java/netty-codec-http-4.1.42:0
# io.netty:netty-codec-http2:4.1.42.Final -> >=dev-java/netty-codec-http2-4.1.42:0
# io.netty:netty-codec-memcache:4.1.42.Final -> >=dev-java/netty-codec-memcache-4.1.42:0
# io.netty:netty-codec-mqtt:4.1.42.Final -> >=dev-java/netty-codec-mqtt-4.1.42:0
# io.netty:netty-codec-redis:4.1.42.Final -> >=dev-java/netty-codec-redis-4.1.42:0
# io.netty:netty-codec-smtp:4.1.42.Final -> >=dev-java/netty-codec-smtp-4.1.42:0
# io.netty:netty-codec-socks:4.1.42.Final -> >=dev-java/netty-codec-socks-4.1.42:0
# io.netty:netty-codec-stomp:4.1.42.Final -> >=dev-java/netty-codec-stomp-4.1.42:0
# io.netty:netty-codec-xml:4.1.42.Final -> >=dev-java/netty-codec-xml-4.1.42:0
# io.netty:netty-common:4.1.42.Final -> >=dev-java/netty-common-4.1.42:0
# io.netty:netty-example:4.1.42.Final -> >=dev-java/netty-example-4.1.42:0
# io.netty:netty-handler:4.1.42.Final -> >=dev-java/netty-handler-4.1.42:0
# io.netty:netty-handler-proxy:4.1.42.Final -> >=dev-java/netty-handler-proxy-4.1.42:0
# io.netty:netty-resolver:4.1.42.Final -> >=dev-java/netty-resolver-4.1.42:0
# io.netty:netty-resolver-dns:4.1.42.Final -> >=dev-java/netty-resolver-dns-4.1.42:0
# io.netty:netty-transport:4.1.42.Final -> >=dev-java/netty-transport-4.1.42:0
# io.netty:netty-transport-native-epoll:4.1.42.Final -> >=dev-java/netty-transport-native-epoll-4.1.42:0
# io.netty:netty-transport-native-kqueue:4.1.42.Final -> >=dev-java/netty-transport-native-kqueue-4.1.42:0
# io.netty:netty-transport-rxtx:4.1.42.Final -> >=dev-java/netty-transport-rxtx-4.1.42:0
# io.netty:netty-transport-sctp:4.1.42.Final -> >=dev-java/netty-transport-sctp-4.1.42:0
# io.netty:netty-transport-udt:4.1.42.Final -> >=dev-java/netty-transport-udt-4.1.42:0
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.jboss.marshalling:jboss-marshalling:1.4.11.Final -> >=dev-java/jboss-marshalling-1.4.11:0
# org.slf4j:slf4j-api:1.7.21 -> >=dev-java/slf4j-api-1.7.28:0

CDEPEND="
	>=dev-java/netty-codec-dns-4.1.42:0
	>=dev-java/netty-codec-haproxy-4.1.42:0
	>=dev-java/netty-codec-http2-4.1.42:0
	>=dev-java/netty-codec-memcache-4.1.42:0
	>=dev-java/netty-codec-mqtt-4.1.42:0
	>=dev-java/netty-codec-redis-4.1.42:0
	>=dev-java/netty-codec-smtp-4.1.42:0
	>=dev-java/netty-codec-socks-4.1.42:0
	>=dev-java/netty-codec-stomp-4.1.42:0
	>=dev-java/netty-codec-xml-4.1.42:0
	>=dev-java/netty-example-4.1.42:0
	>=dev-java/netty-handler-proxy-4.1.42:0
	>=dev-java/netty-resolver-4.1.42:0
	>=dev-java/netty-resolver-dns-4.1.42:0
	>=dev-java/netty-transport-native-epoll-4.1.42:0
	>=dev-java/netty-transport-native-kqueue-4.1.42:0
	>=dev-java/netty-transport-rxtx-4.1.42:0
	>=dev-java/netty-transport-sctp-4.1.42:0
	>=dev-java/netty-transport-udt-4.1.42:0
	>=dev-java/commons-logging-1.2:0
	>=dev-java/jboss-marshalling-1.4.11:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/netty-buffer-4.1.42:0
	>=dev-java/netty-codec-4.1.42:0
	>=dev-java/netty-codec-http-4.1.42:0
	>=dev-java/netty-common-4.1.42:0
	>=dev-java/netty-handler-4.1.42:0
	>=dev-java/netty-transport-4.1.42:0
	>=dev-java/protobuf-java-3.11.4:0
	>=dev-java/slf4j-api-1.7.28:0
"

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
	test? (

		amd64? (
			dev-util/pkgdiff
			dev-util/japi-compliance-checker
		)
	)
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="protobuf-java,commons-logging,netty-buffer,netty-codec,netty-codec-dns,netty-codec-haproxy,netty-codec-http,netty-codec-http2,netty-codec-memcache,netty-codec-mqtt,netty-codec-redis,netty-codec-smtp,netty-codec-socks,netty-codec-stomp,netty-codec-xml,netty-common,netty-example,netty-handler,netty-handler-proxy,netty-resolver,netty-resolver-dns,netty-transport,netty-transport-native-epoll,netty-transport-native-kqueue,netty-transport-rxtx,netty-transport-sctp,netty-transport-udt,log4j,jboss-marshalling,slf4j-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	java-pkg-maven_unpack
	mkdir -p ${JAVA_SRC_DIR}
	mkdir -p resources
	echo -n > ${JAVA_SRC_DIR}/pseudo.java
}
