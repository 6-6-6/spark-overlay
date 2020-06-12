# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-client-3.2.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/hadoop/hadoop-client/3.2.1/hadoop-client-3.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-client-3.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Hadoop Client aggregation pom with dependencies exposed"
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-client:3.2.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-annotations:3.2.1 -> >=app-maven/hadoop-annotations-3.2.1:0
# org.apache.hadoop:hadoop-common:3.2.1 -> >=app-maven/hadoop-common-3.2.1:0
# org.apache.hadoop:hadoop-hdfs-client:3.2.1 -> >=app-maven/hadoop-hdfs-client-3.2.1:0
# org.apache.hadoop:hadoop-mapreduce-client-core:3.2.1 -> >=app-maven/hadoop-mapreduce-client-core-3.2.1:0
# org.apache.hadoop:hadoop-mapreduce-client-jobclient:3.2.1 -> >=app-maven/hadoop-mapreduce-client-jobclient-3.2.1:0
# org.apache.hadoop:hadoop-yarn-api:3.2.1 -> >=app-maven/hadoop-yarn-api-3.2.1:0
# org.apache.hadoop:hadoop-yarn-client:3.2.1 -> >=app-maven/hadoop-yarn-client-3.2.1:0

CDEPEND="
	>=app-maven/hadoop-annotations-3.2.1:0
	>=app-maven/hadoop-common-3.2.1:0
	>=app-maven/hadoop-hdfs-client-3.2.1:0
	>=app-maven/hadoop-mapreduce-client-core-3.2.1:0
	>=app-maven/hadoop-mapreduce-client-jobclient-3.2.1:0
	>=app-maven/hadoop-yarn-api-3.2.1:0
	>=app-maven/hadoop-yarn-client-3.2.1:0
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

JAVA_GENTOO_CLASSPATH="hadoop-annotations,hadoop-common,hadoop-hdfs-client,hadoop-mapreduce-client-core,hadoop-mapreduce-client-jobclient,hadoop-yarn-api,hadoop-yarn-client"
