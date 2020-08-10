# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-example-5.0.0.Alpha2.pom --download-uri https://repo1.maven.org/maven2/io/netty/netty-example/5.0.0.Alpha2/netty-example-5.0.0.Alpha2-sources.jar --slot 0 --keywords "~amd64" --ebuild netty-example-5.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="io.netty:netty-example:5.0.0.Alpha2"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Netty is an asynchronous event-driven network application framework for rapid development of maintainable high performance protocol servers and clients."
HOMEPAGE="http://netty.io/netty-example/"
SRC_URI="https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Alpha2/${P}.Alpha2-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Alpha2/${P}.Alpha2.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha2.pom
# com.google.protobuf:protobuf-java:2.5.0 -> >=dev-java/protobuf-java-3.11.4:0
# com.yammer.metrics:metrics-core:2.2.0 -> >=dev-java/metrics-core-2.2.0:0
# io.netty:netty-codec-http:5.0.0.Alpha2 -> >=dev-java/netty-codec-http-5.0.0:0
# io.netty:netty-codec-http2:5.0.0.Alpha2 -> >=dev-java/netty-codec-http2-5.0.0:0
# io.netty:netty-codec-memcache:5.0.0.Alpha2 -> >=dev-java/netty-codec-memcache-5.0.0:0
# io.netty:netty-codec-socks:5.0.0.Alpha2 -> >=dev-java/netty-codec-socks-5.0.0:0
# io.netty:netty-codec-stomp:5.0.0.Alpha2 -> >=dev-java/netty-codec-stomp-5.0.0:0
# io.netty:netty-handler:5.0.0.Alpha2 -> >=dev-java/netty-handler-5.0.0:0
# io.netty:netty-handler-proxy:5.0.0.Alpha2 -> >=dev-java/netty-handler-proxy-5.0.0:0
# io.netty:netty-tcnative:1.1.32.Fork1 -> >=dev-java/netty-tcnative-1.1.33.15:0
# io.netty:netty-transport:5.0.0.Alpha2 -> >=dev-java/netty-transport-5.0.0:0
# io.netty:netty-transport-rxtx:5.0.0.Alpha2 -> >=dev-java/netty-transport-rxtx-5.0.0:0
# io.netty:netty-transport-sctp:5.0.0.Alpha2 -> >=dev-java/netty-transport-sctp-5.0.0:0
# io.netty:netty-transport-udt:5.0.0.Alpha2 -> >=dev-java/netty-transport-udt-5.0.0:0
# org.eclipse.jetty.npn:npn-api:1.1.1.v20141010 -> >=dev-java/jetty-npn-api-1.1.1_p20141010:0

CDEPEND="
	>=dev-java/metrics-core-2.2.0:0
	>=dev-java/netty-codec-http2-5.0.0:0
	>=dev-java/netty-codec-memcache-5.0.0:0
	>=dev-java/netty-codec-socks-5.0.0:0
	>=dev-java/netty-codec-stomp-5.0.0:0
	>=dev-java/netty-handler-proxy-5.0.0:0
	>=dev-java/netty-transport-rxtx-5.0.0:0
	>=dev-java/netty-transport-sctp-5.0.0:0
	>=dev-java/netty-transport-udt-5.0.0:0
	>=dev-java/jetty-npn-api-1.1.1_p20141010:0
	>=dev-java/netty-codec-http-5.0.0:0
	>=dev-java/netty-handler-5.0.0:0
	>=dev-java/netty-tcnative-1.1.33.15:0
	>=dev-java/netty-transport-5.0.0:0
	>=dev-java/protobuf-java-3.11.4:0
"

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
	test? (
		amd64? (
			dev-util/japi-compliance-checker
			dev-util/pkgdiff
		)
	)"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha2.pom
# ch.qos.logback:logback-classic:1.0.13 -> >=dev-java/logback-classic-1.0.13:0
# com.jcraft:jzlib:1.1.2 -> >=dev-java/jzlib-1.1.3:1.1.3
# org.javassist:javassist:3.19.0-GA -> >=dev-java/javassist-3.21.0:3
RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}
	>=dev-java/logback-classic-1.0.13:0

	>=dev-java/javassist-3.21.0:3

	>=dev-java/jzlib-1.1.3:1.1.3
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="protobuf-java,metrics-core,netty-codec-http,netty-codec-http2,netty-codec-memcache,netty-codec-socks,netty-codec-stomp,netty-handler,netty-handler-proxy,netty-tcnative,netty-transport,netty-transport-rxtx,netty-transport-sctp,netty-transport-udt,jetty-npn-api,logback-classic,jzlib-1.1.3,javassist-3"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_TESTING_FRAMEWORKS="pkgdiff"
