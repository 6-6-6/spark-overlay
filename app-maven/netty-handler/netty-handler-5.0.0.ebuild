# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-handler-5.0.0.Alpha2.pom --download-uri https://repo.maven.apache.org/maven2/io/netty/netty-handler/5.0.0.Alpha2/netty-handler-5.0.0.Alpha2-sources.jar --slot 0 --keywords "~amd64" --ebuild netty-handler-5.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Netty is an asynchronous event-driven network application framework for
    rapid development of maintainable high performance protocol servers and
    clients."
HOMEPAGE="http://netty.io/netty-handler/"
SRC_URI="https://repo.maven.apache.org/maven2/io/netty/${PN}/${PV}.Alpha2/${P}.Alpha2-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.netty:netty-handler:5.0.0.Alpha2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha2.pom
# io.netty:netty-buffer:5.0.0.Alpha2 -> >=app-maven/netty-buffer-5.0.0:0
# io.netty:netty-codec:5.0.0.Alpha2 -> >=app-maven/netty-codec-5.0.0:0
# io.netty:netty-tcnative:1.1.32.Fork1 -> >=app-maven/netty-tcnative-1.1.32:0
# io.netty:netty-transport:5.0.0.Alpha2 -> >=app-maven/netty-transport-5.0.0:0
# org.bouncycastle:bcpkix-jdk15on:1.50 -> >=dev-java/bcpkix-1.50:1.50
# org.eclipse.jetty.alpn:alpn-api:1.1.0.v20141014 -> >=dev-java/jetty-alpn-api-1.1.3_p20160715:0
# org.eclipse.jetty.npn:npn-api:1.1.1.v20141010 -> >=dev-java/jetty-npn-api-8.1.2_p20120308:0

CDEPEND="
	>=app-maven/netty-buffer-5.0.0:0
	>=app-maven/netty-codec-5.0.0:0
	>=app-maven/netty-tcnative-1.1.32:0
	>=app-maven/netty-transport-5.0.0:0
	>=dev-java/bcpkix-1.50:1.50
	>=dev-java/jetty-alpn-api-1.1.3_p20160715:0
	>=dev-java/jetty-npn-api-8.1.2_p20120308:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha2.pom
# org.mortbay.jetty.alpn:alpn-boot:8.1.2.v20141202 -> >=app-maven/alpn-boot-8.1.2_p20141202:0
# org.mortbay.jetty.npn:npn-boot:1.1.9.v20141016 -> >=app-maven/npn-boot-1.1.9_p20141016:0

DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/alpn-boot-8.1.2_p20141202:0
	>=app-maven/npn-boot-1.1.9_p20141016:0
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="netty-buffer,netty-codec,netty-tcnative,netty-transport,bcpkix-1.50,jetty-alpn-api,jetty-npn-api"
JAVA_CLASSPATH_EXTRA="alpn-boot,npn-boot"
