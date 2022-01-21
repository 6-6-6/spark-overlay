# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="io.netty:${PN}:${PV}.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Netty Handler"
HOMEPAGE="https://netty.io/netty-handler/"
SRC_URI="
	https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/conscrypt-openjdk-uber-1.3.0:0
	>=dev-java/bcpkix-jdk15on-1.54:0
	>=dev-java/netty-buffer-4.1.42:0
	>=dev-java/netty-codec-4.1.42:0
	>=dev-java/netty-common-4.1.42:0
	>=dev-java/netty-tcnative-2.0.26:0
	>=dev-java/netty-transport-4.1.42:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
		>=dev-java/jetty-alpn-api-1.1.3_p20160715:0
		>=dev-java/jetty-npn-api-1.1.1_p20141010:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jetty-alpn-api,jetty-npn-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVADOC_ARGS="-source 8"
