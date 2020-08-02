# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-handler-5.0.0.Alpha2.pom --download-uri https://repo1.maven.org/maven2/io/netty/netty-handler/5.0.0.Alpha2/netty-handler-5.0.0.Alpha2-sources.jar --slot 0 --keywords "~amd64" --ebuild netty-handler-5.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary test"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Netty is an asynchronous event-driven network application framework for
rapid development of maintainable high performance protocol servers and clients."
HOMEPAGE="http://netty.io/netty-handler/"
SRC_URI="https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Alpha2/${P}.Alpha2-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Alpha2/${P}.Alpha2.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.netty:netty-handler:5.0.0.Alpha2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha2.pom
# io.netty:netty-buffer:5.0.0.Alpha2 -> >=dev-java/netty-buffer-5.0.0:0
# io.netty:netty-codec:5.0.0.Alpha2 -> >=dev-java/netty-codec-5.0.0:0
# io.netty:netty-tcnative:1.1.32.Fork1 -> >=dev-java/netty-tcnative-1.1.33.15:0
# io.netty:netty-transport:5.0.0.Alpha2 -> >=dev-java/netty-transport-5.0.0:0
# org.bouncycastle:bcpkix-jdk15on:1.50 -> >=dev-java/bcpkix-1.50:1.50
# org.eclipse.jetty.alpn:alpn-api:1.1.0.v20141014 -> >=dev-java/jetty-alpn-api-1.1.2:0
# org.eclipse.jetty.npn:npn-api:1.1.1.v20141010 -> >=dev-java/jetty-npn-api-8.1.2_p20120308:0

CDEPEND="
	>=dev-java/bcpkix-1.50:1.50
	dev-java/jetty-alpn-api:0
	>=dev-java/netty-buffer-5.0.0:0
	>=dev-java/netty-codec-5.0.0:0
	>=dev-java/netty-tcnative-1.1.33.15:0
	>=dev-java/netty-transport-5.0.0:0

	>=dev-java/jetty-npn-api-1.1.1_p20120308:0
	dev-java/tomcat-jni:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha2.pom
# org.mortbay.jetty.alpn:alpn-boot:8.1.2.v20141202 -> >=dev-java/alpn-boot-8.1.2_p20141202:0
# org.mortbay.jetty.npn:npn-boot:1.1.9.v20141016 -> >=dev-java/npn-boot-1.1.9_p20141016:0

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/alpn-boot-8.1.2_p20141202:0
	>=dev-java/npn-boot-1.1.9_p20141016:0
	)
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="netty-buffer,netty-codec,netty-tcnative,netty-transport,bcpkix-1.50,jetty-alpn-api,jetty-npn-api,tomcat-jni"
JAVA_CLASSPATH_EXTRA="alpn-boot,npn-boot"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
