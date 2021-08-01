# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-client-2.7.4.pom --download-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-client/2.7.4/hadoop-client-2.7.4-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-client-2.7.4-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.hadoop:hadoop-client:2.7.4"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Apache Hadoop Client"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# The source JAR on Maven Central does not contain any source files.
# Nevertheless, the pre-built binary JAR does not contain any class file
# either; it only contains a pom.xml and a pom.properties file for unknown
# purpose, plus some license files.
IUSE="+binary"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-annotations:2.7.4 -> >=dev-java/hadoop-annotations-2.7.4:0
# org.apache.hadoop:hadoop-common:2.7.4 -> >=dev-java/hadoop-common-2.7.4:0
# org.apache.hadoop:hadoop-hdfs:2.7.4 -> >=dev-java/hadoop-hdfs-2.7.4:0
# org.apache.hadoop:hadoop-mapreduce-client-app:2.7.4 -> >=dev-java/hadoop-mapreduce-client-app-2.7.4:0
# org.apache.hadoop:hadoop-mapreduce-client-core:2.7.4 -> >=dev-java/hadoop-mapreduce-client-core-2.7.4:0
# org.apache.hadoop:hadoop-mapreduce-client-jobclient:2.7.4 -> >=dev-java/hadoop-mapreduce-client-jobclient-2.7.4:0
# org.apache.hadoop:hadoop-yarn-api:2.7.4 -> >=dev-java/hadoop-yarn-api-2.7.4:0

CDEPEND="
	>=dev-java/hadoop-annotations-2.7.4:0
	>=dev-java/hadoop-common-2.7.4:0
	>=dev-java/hadoop-hdfs-2.7.4:0
	>=dev-java/hadoop-mapreduce-client-app-2.7.4:0
	>=dev-java/hadoop-mapreduce-client-core-2.7.4:0
	>=dev-java/hadoop-mapreduce-client-jobclient-2.7.4:0
	>=dev-java/hadoop-yarn-api-2.7.4:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="hadoop-annotations,hadoop-common,hadoop-hdfs,hadoop-mapreduce-client-app,hadoop-mapreduce-client-core,hadoop-mapreduce-client-jobclient,hadoop-yarn-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
