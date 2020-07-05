# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-codec-5.0.0.Alpha2.pom --download-uri https://repo.maven.apache.org/maven2/io/netty/netty-codec/5.0.0.Alpha2/netty-codec-5.0.0.Alpha2-sources.jar --slot 0 --keywords "~amd64" --ebuild netty-codec-5.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Netty is an asynchronous event-driven network application framework for
    rapid development of maintainable high performance protocol servers and
    clients."
HOMEPAGE="http://netty.io/netty-codec/"
SRC_URI="https://repo.maven.apache.org/maven2/io/netty/${PN}/${PV}.Alpha2/${P}.Alpha2-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.netty:netty-codec:5.0.0.Alpha2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha2.pom
# com.github.jponge:lzma-java:1.3 -> >=app-maven/lzma-java-1.3:0
# com.google.protobuf:protobuf-java:2.5.0 -> >=dev-java/protobuf-java-3.11.4:0
# com.jcraft:jzlib:1.1.2 -> >=dev-java/jzlib-1.1.3:1.1.3
# com.ning:compress-lzf:1.0.1 -> >=app-maven/compress-lzf-1.0.1:0
# io.netty:netty-transport:5.0.0.Alpha2 -> >=app-maven/netty-transport-5.0.0:0
# net.jpountz.lz4:lz4:1.2.0 -> >=app-maven/lz4-1.2.0:0
# org.jboss.marshalling:jboss-marshalling:1.3.18.GA -> >=dev-java/jboss-marshalling-1.3.18:0

CDEPEND="
	>=app-maven/compress-lzf-1.0.1:0
	>=app-maven/lz4-1.2.0:0
	>=app-maven/lzma-java-1.3:0
	>=app-maven/netty-transport-5.0.0:0
	>=dev-java/jboss-marshalling-1.3.18:0
	>=dev-java/jzlib-1.1.3:1.1.3
	>=dev-java/protobuf-java-3.11.4:0
"


DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="lzma-java,protobuf-java,jzlib-1.1.3,compress-lzf,netty-transport,lz4,jboss-marshalling"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
