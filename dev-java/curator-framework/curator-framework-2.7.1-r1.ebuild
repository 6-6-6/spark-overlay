# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/curator-framework-2.7.1.pom --download-uri https://repo1.maven.org/maven2/org/apache/curator/curator-framework/2.7.1/curator-framework-2.7.1-sources.jar --slot 0 --keywords "~amd64" --ebuild curator-framework-2.7.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="High-level API that greatly simplifies using ZooKeeper."
HOMEPAGE="http://curator.apache.org/curator-framework"
SRC_URI="https://repo1.maven.org/maven2/org/apache/curator/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/curator/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.curator:curator-framework:2.7.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava:16.0.1 -> >=dev-java/guava-29.0:0
# org.apache.curator:curator-client:2.7.1 -> >=dev-java/curator-client-2.7.1:0
# org.apache.zookeeper:zookeeper:3.4.6 -> >=dev-java/zookeeper-3.4.6:0

CDEPEND="
	>=dev-java/curator-client-2.7.1:0
	>=dev-java/zookeeper-3.4.6:0
	>=dev-java/guava-29.0:0
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

JAVA_GENTOO_CLASSPATH="guava,curator-client,zookeeper"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

