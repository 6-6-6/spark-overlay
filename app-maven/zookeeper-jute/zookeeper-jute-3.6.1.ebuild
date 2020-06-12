# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/zookeeper-jute-3.6.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/zookeeper/zookeeper-jute/3.6.1/zookeeper-jute-3.6.1-sources.jar --slot 0 --keywords "~amd64" --ebuild zookeeper-jute-3.6.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="ZooKeeper jute"
HOMEPAGE="http://zookeeper.apache.org/zookeeper-jute"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/zookeeper/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.zookeeper:zookeeper-jute:3.6.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.yetus:audience-annotations:0.5.0 -> >=app-maven/audience-annotations-0.12.0:0

CDEPEND="
	>=app-maven/audience-annotations-0.12.0:0
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

JAVA_GENTOO_CLASSPATH="audience-annotations"
