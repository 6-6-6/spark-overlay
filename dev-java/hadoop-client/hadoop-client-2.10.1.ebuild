# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-client-2.10.1.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-client/2.10.1/hadoop-client-2.10.1-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-client/2.10.1/hadoop-client-2.10.1.jar --slot 0 --keywords "~amd64" --ebuild hadoop-client-2.10.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.hadoop:hadoop-client:2.10.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Apache Hadoop Client"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-annotations:2.10.1 -> >=dev-java/hadoop-annotations-2.10.1:0
# org.apache.hadoop:hadoop-common:2.10.1 -> >=dev-java/hadoop-common-2.10.1:0
# org.apache.hadoop:hadoop-hdfs-client:2.10.1 -> >=dev-java/hadoop-hdfs-client-2.10.1:0
# org.apache.hadoop:hadoop-mapreduce-client-app:2.10.1 -> >=dev-java/hadoop-mapreduce-client-app-2.10.1:0
# org.apache.hadoop:hadoop-mapreduce-client-core:2.10.1 -> >=dev-java/hadoop-mapreduce-client-core-2.10.1:0
# org.apache.hadoop:hadoop-mapreduce-client-jobclient:2.10.1 -> >=dev-java/hadoop-mapreduce-client-jobclient-2.10.1:0
# org.apache.hadoop:hadoop-yarn-api:2.10.1 -> >=dev-java/hadoop-yarn-api-2.10.1:0

CDEPEND="
	>=dev-java/hadoop-annotations-2.10.1:0
	>=dev-java/hadoop-common-2.10.1:0
	>=dev-java/hadoop-hdfs-client-2.10.1:0
	>=dev-java/hadoop-mapreduce-client-app-2.10.1:0
	>=dev-java/hadoop-mapreduce-client-core-2.10.1:0
	>=dev-java/hadoop-mapreduce-client-jobclient-2.10.1:0
	>=dev-java/hadoop-yarn-api-2.10.1:0
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

JAVA_GENTOO_CLASSPATH="hadoop-annotations,hadoop-common,hadoop-hdfs-client,hadoop-mapreduce-client-app,hadoop-mapreduce-client-core,hadoop-mapreduce-client-jobclient,hadoop-yarn-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
