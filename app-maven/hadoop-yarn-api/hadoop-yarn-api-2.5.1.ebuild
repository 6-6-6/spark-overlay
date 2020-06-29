# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-yarn-api-2.5.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/hadoop/hadoop-yarn-api/2.5.1/hadoop-yarn-api-2.5.1-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-yarn-api-2.5.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Hadoop Project POM"
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-yarn-api:2.5.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava:11.0.2 -> >=dev-java/guava-20.0:0
# com.google.protobuf:protobuf-java:2.5.0 -> >=dev-java/protobuf-java-3.11.4:0
# commons-lang:commons-lang:2.6 -> >=dev-java/commons-lang-2.6:2.1
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# org.apache.hadoop:hadoop-annotations:2.5.1 -> >=app-maven/hadoop-annotations-2.6.0:0

CDEPEND="
	>=app-maven/hadoop-annotations-2.6.0:0
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/commons-logging-1.2:0
	>=dev-java/guava-20.0:0
	>=dev-java/protobuf-java-3.11.4:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-common:2.5.1 -> >=app-maven/hadoop-common-2.6.0:0

DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/hadoop-common-2.6.0:0
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guava-${PV%.*},protobuf-java,commons-lang-2.1,commons-logging,hadoop-annotations"
JAVA_CLASSPATH_EXTRA="hadoop-common"
