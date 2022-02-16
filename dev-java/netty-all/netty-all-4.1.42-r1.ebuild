# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MAVEN_ID="io.netty:${PN}:${PV}.Final"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The package for all Netty components"
HOMEPAGE="https://netty.io/"
SRC_URI="https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
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
	dev-java/log4j-12-api:2
	>=dev-java/netty-buffer-4.1.42:0
	>=dev-java/netty-codec-4.1.42:0
	>=dev-java/netty-codec-http-4.1.42:0
	>=dev-java/netty-common-4.1.42:0
	>=dev-java/netty-handler-4.1.42:0
	>=dev-java/netty-transport-4.1.42:0
	>=dev-java/protobuf-java-3.11.4:0
	>=dev-java/slf4j-api-1.7.28:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	java-pkg-maven_src_unpack
	echo -n > "${JAVA_SRC_DIR}/pseudo.java"
}
