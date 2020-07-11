# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/alpn-boot-8.1.2.v20141202.pom --download-uri https://repo1.maven.org/maven2/org/mortbay/jetty/alpn/alpn-boot/8.1.2.v20141202/alpn-boot-8.1.2.v20141202-sources.jar --slot 0 --keywords "~amd64" --ebuild alpn-boot-8.1.2_p20141202.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A pure Java(TM) implementation of the Application Layer Protocol Negotiation TLS Extension"
HOMEPAGE="http://www.eclipse.org/jetty/alpn-project/alpn-boot"
SRC_URI="https://repo1.maven.org/maven2/org/mortbay/jetty/alpn/${PN}/8.1.2.v20141202/${PN}-8.1.2.v20141202-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/org/mortbay/jetty/alpn/${PN}/8.1.2.v20141202/${PN}-8.1.2.v20141202.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.mortbay.jetty.alpn:alpn-boot:8.1.2.v20141202"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	dev-java/jetty-alpn-api:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jetty-alpn-api"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
