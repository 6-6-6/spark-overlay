# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/reactor-netty-0.9.7.RELEASE.pom --download-uri https://repo.maven.apache.org/maven2/io/projectreactor/netty/reactor-netty/0.9.7.RELEASE/reactor-netty-0.9.7.RELEASE-sources.jar --slot 0 --keywords "~amd64" --ebuild reactor-netty-0.9.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Reactive Streams Netty driver"
HOMEPAGE="https://github.com/reactor/reactor-netty"
SRC_URI="https://repo.maven.apache.org/maven2/io/projectreactor/netty/${PN}/${PV}.RELEASE/${P}.RELEASE-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.projectreactor.netty:reactor-netty:0.9.7.RELEASE"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.RELEASE.pom
# io.micrometer:micrometer-core:1.3.0 -> >=app-maven/micrometer-core-1.5.1:0
# io.netty:netty-codec-haproxy:4.1.49.Final -> >=app-maven/netty-codec-haproxy-5.0.0:0
# io.netty:netty-codec-http:4.1.49.Final -> >=app-maven/netty-codec-http-5.0.0:0
# io.netty:netty-codec-http2:4.1.49.Final -> >=app-maven/netty-codec-http2-5.0.0:0
# io.netty:netty-handler:4.1.49.Final -> >=app-maven/netty-handler-5.0.0:0
# io.netty:netty-handler-proxy:4.1.49.Final -> >=app-maven/netty-handler-proxy-5.0.0:0
# io.netty:netty-transport-native-epoll:4.1.49.Final -> >=app-maven/netty-transport-native-epoll-5.0.0:0
# io.netty:netty-transport-native-kqueue:4.1.49.Final -> >=app-maven/netty-transport-native-kqueue-4.1.50:0
# io.projectreactor:reactor-core:3.3.5.RELEASE -> >=app-maven/reactor-core-3.3.6:0
# org.slf4j:slf4j-api:1.7.30 -> >=dev-java/slf4j-api-2.0.0_alpha1:0

CDEPEND="
	>=app-maven/micrometer-core-1.5.1:0
	>=app-maven/netty-codec-haproxy-5.0.0:0
	>=app-maven/netty-codec-http-5.0.0:0
	>=app-maven/netty-codec-http2-5.0.0:0
	>=app-maven/netty-handler-5.0.0:0
	>=app-maven/netty-handler-proxy-5.0.0:0
	>=app-maven/netty-transport-native-epoll-5.0.0:0
	>=app-maven/netty-transport-native-kqueue-4.1.50:0
	>=app-maven/reactor-core-3.3.6:0
	>=dev-java/slf4j-api-2.0.0_alpha1:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="micrometer-core,netty-codec-haproxy,netty-codec-http,netty-codec-http2,netty-handler,netty-handler-proxy,netty-transport-native-epoll,netty-transport-native-kqueue,reactor-core,slf4j-api"
