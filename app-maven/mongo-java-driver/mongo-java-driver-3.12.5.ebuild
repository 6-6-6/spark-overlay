# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/mongo-java-driver-3.12.5.pom --download-uri https://repo.maven.apache.org/maven2/org/mongodb/mongo-java-driver/3.12.5/mongo-java-driver-3.12.5-sources.jar --slot 0 --keywords "~amd64" --ebuild mongo-java-driver-3.12.5.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The MongoDB Java Driver uber-artifact, containing the legacy driver, the mongodb-driver, mongodb-driver-core, and bson"
HOMEPAGE="http://www.mongodb.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/mongodb/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.mongodb:mongo-java-driver:3.12.5"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.jnr:jnr-unixsocket:0.18 -> >=dev-java/jnr-unixsocket-0.6:0
# com.github.luben:zstd-jni:1.3.8-3 -> >=app-maven/zstd-jni-1.4.5.4:0
# io.netty:netty-buffer:4.1.17.Final -> >=dev-java/netty-buffer-4.0.21:0
# io.netty:netty-handler:4.1.17.Final -> >=dev-java/netty-buffer-4.0.21:0
# io.netty:netty-transport:4.1.17.Final -> >=dev-java/netty-buffer-4.0.21:0
# org.mongodb:mongodb-crypt:1.0.1 -> >=app-maven/mongodb-crypt-1.0.1:0
# org.slf4j:slf4j-api:1.7.6 -> >=dev-java/slf4j-api-1.7.7:0
# org.xerial.snappy:snappy-java:1.1.4 -> >=dev-java/snappy-1.0.3_rc3:1.0

CDEPEND="
	>=app-maven/mongodb-crypt-1.0.1:0
	>=app-maven/zstd-jni-1.4.5.4:0
	>=dev-java/jnr-unixsocket-0.6:0
	>=dev-java/netty-buffer-4.0.21:0
	>=dev-java/slf4j-api-1.7.7:0
	>=dev-java/snappy-1.0.3_rc3:1.0
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

JAVA_GENTOO_CLASSPATH="jnr-unixsocket,zstd-jni,netty-buffer,netty-buffer,netty-buffer,mongodb-crypt,slf4j-api,snappy-1.0"
