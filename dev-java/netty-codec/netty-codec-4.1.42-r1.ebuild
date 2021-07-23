# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-codec-4.1.42.Final.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/io/netty/netty-codec/4.1.42.Final/netty-codec-4.1.42.Final-sources.jar --binjar-uri https://repo1.maven.org/maven2/io/netty/netty-codec/4.1.42.Final/netty-codec-4.1.42.Final.jar --slot 0 --keywords "~amd64" --ebuild netty-codec-4.1.42.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="io.netty:netty-codec:4.1.42.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Asynchronous event-driven network application framework"
HOMEPAGE="https://netty.io/netty-codec/"
SRC_URI="https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# com.github.jponge:lzma-java:1.3 -> >=dev-java/lzma-java-1.3:0
# com.google.protobuf:protobuf-java:2.6.1 -> >=dev-java/protobuf-java-3.11.4:0
# com.google.protobuf.nano:protobuf-javanano:3.0.0-alpha-5 -> >=dev-java/protobuf-javanano-3.0.0_alpha5:0
# com.jcraft:jzlib:1.1.3 -> >=dev-java/jzlib-1.1.3-r2:0
# com.ning:compress-lzf:1.0.3 -> >=dev-java/compress-lzf-1.0.3:0
# io.netty:netty-buffer:4.1.42.Final -> >=dev-java/netty-buffer-4.1.42:0
# io.netty:netty-common:4.1.42.Final -> >=dev-java/netty-common-4.1.42:0
# io.netty:netty-transport:4.1.42.Final -> >=dev-java/netty-transport-4.1.42:0
# net.jpountz.lz4:lz4:1.3.0 -> >=dev-java/lz4-java-1.3.0:0
# org.jboss.marshalling:jboss-marshalling:1.4.11.Final -> >=dev-java/jboss-marshalling-1.4.11:0

CDEPEND="
	>=dev-java/protobuf-javanano-3.0.0_alpha5:0
	>=dev-java/compress-lzf-1.0.3:0
	>=dev-java/jboss-marshalling-1.4.11:0
	>=dev-java/jzlib-1.1.3-r2:0
	>=dev-java/lz4-java-1.3.0:0
	>=dev-java/lzma-java-1.3:0
	>=dev-java/netty-buffer-4.1.42:0
	>=dev-java/netty-common-4.1.42:0
	>=dev-java/netty-transport-4.1.42:0
	>=dev-java/protobuf-java-3.11.4:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="lzma-java,protobuf-java,protobuf-javanano,jzlib,compress-lzf,netty-buffer,netty-common,netty-transport,lz4-java,jboss-marshalling"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
