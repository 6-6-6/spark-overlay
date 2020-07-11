# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-client-2.5.1.pom --download-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-client/2.5.1/hadoop-client-2.5.1.jar --slot 0 --keywords "~amd64" --ebuild hadoop-client-2.5.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Apache Hadoop Client"
HOMEPAGE=""
SRC_URI="https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-client:2.5.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-annotations:2.5.1 -> >=app-maven/hadoop-annotations-2.5.1:0
# org.apache.hadoop:hadoop-common:2.5.1 -> >=app-maven/hadoop-common-2.5.1:0
# org.apache.hadoop:hadoop-hdfs:2.5.1 -> >=app-maven/hadoop-hdfs-2.5.1:0
# org.apache.hadoop:hadoop-mapreduce-client-app:2.5.1 -> >=app-maven/hadoop-mapreduce-client-app-2.5.1:0
# org.apache.hadoop:hadoop-mapreduce-client-core:2.5.1 -> >=app-maven/hadoop-mapreduce-client-core-2.5.1:0
# org.apache.hadoop:hadoop-mapreduce-client-jobclient:2.5.1 -> >=app-maven/hadoop-mapreduce-client-jobclient-2.5.1:0
# org.apache.hadoop:hadoop-yarn-api:2.5.1 -> >=app-maven/hadoop-yarn-api-2.5.1:0

CDEPEND="
	>=app-maven/hadoop-annotations-2.5.1:0
	>=app-maven/hadoop-common-2.5.1:0
	>=app-maven/hadoop-hdfs-2.5.1:0
	>=app-maven/hadoop-mapreduce-client-app-2.5.1:0
	>=app-maven/hadoop-mapreduce-client-core-2.5.1:0
	>=app-maven/hadoop-mapreduce-client-jobclient-2.5.1:0
	>=app-maven/hadoop-yarn-api-2.5.1:0
"


DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="hadoop-annotations,hadoop-common,hadoop-hdfs,hadoop-mapreduce-client-app,hadoop-mapreduce-client-core,hadoop-mapreduce-client-jobclient,hadoop-yarn-api"
JAVA_SRC_DIR="src/main/java"
