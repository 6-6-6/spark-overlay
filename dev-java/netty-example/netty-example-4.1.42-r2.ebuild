# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="io.netty:${PN}:${PV}.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Asynchronous event-driven network application framework"
HOMEPAGE="https://netty.io/"
SRC_URI="
	https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/conscrypt-openjdk-uber-1.3.0:0
	dev-java/jakarta-activation-api:1
	>=dev-java/netty-codec-http2-4.1.42:0
	>=dev-java/netty-codec-memcache-4.1.42:0
	>=dev-java/netty-codec-mqtt-4.1.42:0
	>=dev-java/netty-codec-redis-4.1.42:0
	>=dev-java/netty-codec-socks-4.1.42:0
	>=dev-java/netty-codec-stomp-4.1.42:0
	>=dev-java/netty-handler-proxy-4.1.42:0
	>=dev-java/netty-transport-rxtx-4.1.42:0
	>=dev-java/netty-transport-sctp-4.1.42:0
	>=dev-java/netty-transport-udt-4.1.42:0
	>=dev-java/bcpkix-jdk15on-1.54:0
	>=dev-java/bcprov-1.54:1.54
	>=dev-java/metrics-core-2.2.0:0
	>=dev-java/netty-buffer-4.1.42:0
	>=dev-java/netty-codec-4.1.42:0
	>=dev-java/netty-codec-http-4.1.42:0
	>=dev-java/netty-common-4.1.42:0
	>=dev-java/netty-handler-4.1.42:0
	>=dev-java/netty-tcnative-2.0.26:0
	>=dev-java/netty-transport-4.1.42:0
	>=dev-java/protobuf-java-3.11.4:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
		>=dev-java/jetty-npn-api-1.1.1_p20141010:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
	>=dev-java/javassist-3.21.0:3
	>=dev-java/jzlib-1.1.3-r2:0
	>=dev-java/logback-classic-1.2.3:0
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jetty-npn-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_install() {
	java-pkg-simple_src_install
	java-pkg_register-dependency javassist-3,jzlib,logback-classic
}
