# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/curator-client-5.0.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/curator/curator-client/5.0.0/curator-client-5.0.0-sources.jar --slot 0 --keywords "~amd64" --ebuild curator-client-5.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Low-level API"
HOMEPAGE="http://curator.apache.org/curator-client"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/curator/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.curator:curator-client:5.0.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava:27.0.1-jre -> >=dev-java/guava-29.0:0
# org.apache.zookeeper:zookeeper:3.6.0 -> >=app-maven/zookeeper-3.6.1:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-2.0.0_alpha1:0

CDEPEND="
	>=app-maven/zookeeper-3.6.1:0
	>=dev-java/guava-29.0:0
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

JAVA_GENTOO_CLASSPATH="guava,zookeeper,slf4j-api"
JAVA_RESOURCE_DIRS=(
	"../../../../../../../../var/lib/java-ebuilder/poms"
)
