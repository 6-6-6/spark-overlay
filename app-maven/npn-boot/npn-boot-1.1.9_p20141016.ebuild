# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/npn-boot-1.1.9.v20141016.pom --download-uri https://repo.maven.apache.org/maven2/org/mortbay/jetty/npn/npn-boot/1.1.9.v20141016/npn-boot-1.1.9.v20141016-sources.jar --slot 0 --keywords "~amd64" --ebuild npn-boot-1.1.9_p20141016.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A pure Java(TM) implementation of the Next Protocol Negotiation TLS Extension"
HOMEPAGE="http://www.eclipse.org/jetty/npn-project/npn-boot"
SRC_URI="https://repo.maven.apache.org/maven2/org/mortbay/jetty/npn/${PN}/1.1.9.v20141016/${PN}-1.1.9.v20141016-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.mortbay.jetty.npn:npn-boot:1.1.9.v20141016"



DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.7:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
