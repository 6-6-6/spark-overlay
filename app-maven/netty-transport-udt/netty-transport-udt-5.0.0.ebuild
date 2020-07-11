# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-transport-udt-5.0.0.Alpha2.pom --download-uri https://repo1.maven.org/maven2/io/netty/netty-transport-udt/5.0.0.Alpha2/netty-transport-udt-5.0.0.Alpha2-sources.jar --slot 0 --keywords "~amd64" --ebuild netty-transport-udt-5.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Netty is an asynchronous event-driven network application framework for
    rapid development of maintainable high performance protocol servers and
    clients."
HOMEPAGE="http://netty.io/netty-transport-udt/"
SRC_URI="https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Alpha2/${P}.Alpha2-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Alpha2/${P}.Alpha2.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.netty:netty-transport-udt:5.0.0.Alpha2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha2.pom
# com.barchart.udt:barchart-udt-bundle:2.3.0 -> >=dev-java/barchart-udt-2.3.0:0
# io.netty:netty-buffer:5.0.0.Alpha2 -> >=dev-java/netty-buffer-5.0.0:0
# io.netty:netty-transport:5.0.0.Alpha2 -> >=dev-java/netty-transport-5.0.0:0

CDEPEND="
	>=dev-java/barchart-udt-2.3.0:0
	>=dev-java/netty-buffer-5.0.0:0
	>=dev-java/netty-transport-5.0.0:0
"


DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="barchart-udt,netty-buffer,netty-transport"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
