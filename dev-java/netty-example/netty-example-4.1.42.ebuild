# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-example-4.1.42.Final.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/io/netty/netty-example/4.1.42.Final/netty-example-4.1.42.Final-sources.jar --binjar-uri https://repo1.maven.org/maven2/io/netty/netty-example/4.1.42.Final/netty-example-4.1.42.Final.jar --slot 0 --keywords "~amd64" --ebuild netty-example-4.1.42.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MAVEN_ID="io.netty:netty-example:4.1.42.Final"
DESCRIPTION="Netty is an asynchronous event-driven network application framework for rapid development of maintainable high performance protocol servers and clients."
HOMEPAGE="https://netty.io/netty-example/"
SRC_URI="https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# com.google.protobuf:protobuf-java:2.6.1 -> >=dev-java/protobuf-java-3.11.4:0
# com.sun.activation:javax.activation:1.2.0 -> >=dev-java/javax-activation-1.2.0:0
# com.yammer.metrics:metrics-core:2.2.0 -> >=dev-java/metrics-core-2.2.0:0
# io.netty:netty-buffer:4.1.42.Final -> >=dev-java/netty-buffer-4.1.42:0
# io.netty:netty-codec:4.1.42.Final -> >=dev-java/netty-codec-4.1.42:0
# io.netty:netty-codec-http:4.1.42.Final -> >=dev-java/netty-codec-http-4.1.42:0
# io.netty:netty-codec-http2:4.1.42.Final -> >=dev-java/netty-codec-http2-4.1.42:0
# io.netty:netty-codec-memcache:4.1.42.Final -> >=dev-java/netty-codec-memcache-4.1.42:0
# io.netty:netty-codec-mqtt:4.1.42.Final -> >=dev-java/netty-codec-mqtt-4.1.42:0
# io.netty:netty-codec-redis:4.1.42.Final -> >=dev-java/netty-codec-redis-4.1.42:0
# io.netty:netty-codec-socks:4.1.42.Final -> >=dev-java/netty-codec-socks-4.1.42:0
# io.netty:netty-codec-stomp:4.1.42.Final -> >=dev-java/netty-codec-stomp-4.1.42:0
# io.netty:netty-common:4.1.42.Final -> >=dev-java/netty-common-4.1.42:0
# io.netty:netty-handler:4.1.42.Final -> >=dev-java/netty-handler-4.1.42:0
# io.netty:netty-handler-proxy:4.1.42.Final -> >=dev-java/netty-handler-proxy-4.1.42:0
# io.netty:netty-tcnative:2.0.26.Final -> >=dev-java/netty-tcnative-2.0.26:0
# io.netty:netty-transport:4.1.42.Final -> >=dev-java/netty-transport-4.1.42:0
# io.netty:netty-transport-rxtx:4.1.42.Final -> >=dev-java/netty-transport-rxtx-4.1.42:0
# io.netty:netty-transport-sctp:4.1.42.Final -> >=dev-java/netty-transport-sctp-4.1.42:0
# io.netty:netty-transport-udt:4.1.42.Final -> >=dev-java/netty-transport-udt-4.1.42:0
# org.bouncycastle:bcpkix-jdk15on:1.54 -> >=dev-java/bcpkix-jdk15on-1.54:0
# org.bouncycastle:bcprov-jdk15on:1.54 -> >=dev-java/bcprov-1.54:1.54
# org.conscrypt:conscrypt-openjdk-uber:1.3.0 -> >=dev-java/conscrypt-openjdk-uber-1.3.0:0

CDEPEND="
	>=dev-java/conscrypt-openjdk-uber-1.3.0:0
	>=dev-java/javax-activation-1.2.0:0
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

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# org.eclipse.jetty.npn:npn-api:1.1.1.v20141010 -> >=dev-java/jetty-npn-api-1.1.1_p20141010:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/jetty-npn-api-1.1.1_p20141010:0
	)
	test? (

		amd64? (
			dev-util/pkgdiff
			dev-util/japi-compliance-checker
		)
	)
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# ch.qos.logback:logback-classic:1.1.7 -> >=dev-java/logback-classic-1.2.3:0
# com.jcraft:jzlib:1.1.3 -> >=dev-java/jzlib-1.1.3:1.1.3
# org.javassist:javassist:3.20.0-GA -> >=dev-java/javassist-3.21.0:3

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}
	>=dev-java/javassist-3.21.0:3

	>=dev-java/jzlib-1.1.3:1.1.3

	>=dev-java/logback-classic-1.2.3:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="protobuf-java,javax-activation,metrics-core,netty-buffer,netty-codec,netty-codec-http,netty-codec-http2,netty-codec-memcache,netty-codec-mqtt,netty-codec-redis,netty-codec-socks,netty-codec-stomp,netty-common,netty-handler,netty-handler-proxy,netty-tcnative,netty-transport,netty-transport-rxtx,netty-transport-sctp,netty-transport-udt,bcpkix-jdk15on,bcprov-1.54,conscrypt-openjdk-uber,logback-classic,jzlib-1.1.3,javassist-3"
JAVA_CLASSPATH_EXTRA="jetty-npn-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TESTING_FRAMEWORKS="pkgdiff"
