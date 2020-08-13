# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-handler-4.1.42.Final.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/io/netty/netty-handler/4.1.42.Final/netty-handler-4.1.42.Final-sources.jar --binjar-uri https://repo1.maven.org/maven2/io/netty/netty-handler/4.1.42.Final/netty-handler-4.1.42.Final.jar --slot 0 --keywords "~amd64" --ebuild netty-handler-4.1.42.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MAVEN_ID="io.netty:netty-handler:4.1.42.Final"
DESCRIPTION="Netty is an asynchronous event-driven network application framework for rapid development of maintainable high performance protocol servers and clients."
HOMEPAGE="https://netty.io/netty-handler/"
SRC_URI="https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# io.netty:netty-buffer:4.1.42.Final -> >=dev-java/netty-buffer-4.1.42:0
# io.netty:netty-codec:4.1.42.Final -> >=dev-java/netty-codec-4.1.42:0
# io.netty:netty-common:4.1.42.Final -> >=dev-java/netty-common-4.1.42:0
# io.netty:netty-tcnative:2.0.26.Final -> >=dev-java/netty-tcnative-2.0.26:0
# io.netty:netty-transport:4.1.42.Final -> >=dev-java/netty-transport-4.1.42:0
# org.bouncycastle:bcpkix-jdk15on:1.54 -> >=dev-java/bcpkix-jdk15on-1.54:0
# org.conscrypt:conscrypt-openjdk-uber:1.3.0 -> >=dev-java/conscrypt-openjdk-uber-1.3.0:0

CDEPEND="
	>=dev-java/conscrypt-openjdk-uber-1.3.0:0
	>=dev-java/bcpkix-jdk15on-1.54:0
	>=dev-java/netty-buffer-4.1.42:0
	>=dev-java/netty-codec-4.1.42:0
	>=dev-java/netty-common-4.1.42:0
	>=dev-java/netty-tcnative-2.0.26:0
	>=dev-java/netty-transport-4.1.42:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# org.eclipse.jetty.alpn:alpn-api:1.1.2.v20150522 -> >=dev-java/jetty-alpn-api-1.1.3_p20160715:0
# org.eclipse.jetty.npn:npn-api:1.1.1.v20141010 -> >=dev-java/jetty-npn-api-1.1.1_p20141010:0

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/jetty-alpn-api-1.1.3_p20160715:0
	>=dev-java/jetty-npn-api-1.1.1_p20141010:0
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

JAVA_GENTOO_CLASSPATH="netty-buffer,netty-codec,netty-common,netty-tcnative,netty-transport,bcpkix-jdk15on,conscrypt-openjdk-uber"
JAVA_CLASSPATH_EXTRA="jetty-alpn-api,jetty-npn-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TESTING_FRAMEWORKS="pkgdiff"
