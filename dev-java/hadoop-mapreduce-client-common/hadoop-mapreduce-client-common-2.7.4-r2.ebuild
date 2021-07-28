# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-mapreduce-client-common-2.7.4.pom --download-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-mapreduce-client-common/2.7.4/hadoop-mapreduce-client-common-2.7.4-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-mapreduce-client-common-2.7.4-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.hadoop:hadoop-mapreduce-client-common:2.7.4"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Apache Hadoop Project POM"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.inject.extensions:guice-servlet:3.0 -> >=dev-java/guice-4.1:4
# com.google.protobuf:protobuf-java:2.5.0 -> >=dev-java/protobuf-java-3.11.4:0
# io.netty:netty:3.6.2.Final -> >=dev-java/netty-3.7.0:0
# org.apache.avro:avro:1.7.4 -> >=dev-java/avro-1.8.2:0
# org.apache.hadoop:hadoop-annotations:2.7.4 -> >=dev-java/hadoop-annotations-2.7.4:0
# org.apache.hadoop:hadoop-mapreduce-client-core:2.7.4 -> >=dev-java/hadoop-mapreduce-client-core-2.7.4:0
# org.apache.hadoop:hadoop-yarn-client:2.7.4 -> >=dev-java/hadoop-yarn-client-2.7.4:0
# org.apache.hadoop:hadoop-yarn-common:2.7.4 -> >=dev-java/hadoop-yarn-common-2.7.4:0
# org.apache.hadoop:hadoop-yarn-server-common:2.7.4 -> >=dev-java/hadoop-yarn-server-common-2.7.4:0
# org.slf4j:slf4j-api:1.7.10 -> >=dev-java/slf4j-api-1.7.28:0
# org.slf4j:slf4j-log4j12:1.7.10 -> >=dev-java/slf4j-log4j12-1.7.28:0

CDEPEND="
	>=dev-java/avro-1.8.2:0
	>=dev-java/hadoop-annotations-2.7.4:0
	>=dev-java/hadoop-mapreduce-client-core-2.7.4:0
	>=dev-java/hadoop-yarn-client-2.7.4:0
	>=dev-java/hadoop-yarn-common-2.7.4:0
	>=dev-java/hadoop-yarn-server-common-2.7.4:0
	>=dev-java/netty-3.7.0:0
	>=dev-java/guice-4.1:4
	>=dev-java/protobuf-java-3.11.4:0
	>=dev-java/slf4j-api-1.7.28:0
	>=dev-java/slf4j-log4j12-1.7.28:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava:11.0.2 -> >=dev-java/guava-29.0:0
# commons-cli:commons-cli:1.2 -> >=dev-java/commons-cli-1.3.1:1
# commons-codec:commons-codec:1.4 -> >=dev-java/commons-codec-1.7:0
# commons-collections:commons-collections:3.2.2 -> >=dev-java/commons-collections-3.2.2:0
# commons-lang:commons-lang:2.6 -> >=dev-java/commons-lang-2.6:2.1
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# org.apache.hadoop:hadoop-common:2.7.4 -> >=dev-java/hadoop-common-2.7.4:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/hadoop-common-2.7.4:0
		>=dev-java/commons-cli-1.3.1:1
		>=dev-java/commons-codec-1.7:0
		>=dev-java/commons-collections-3.2.2:0
		>=dev-java/commons-lang-2.6:2.1
		>=dev-java/commons-logging-1.2:0
		>=dev-java/guava-29.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guice-4,protobuf-java,netty,avro,hadoop-annotations,hadoop-mapreduce-client-core,hadoop-yarn-client,hadoop-yarn-common,hadoop-yarn-server-common,slf4j-api,slf4j-log4j12"
JAVA_CLASSPATH_EXTRA="guava,commons-cli-1,commons-codec,commons-collections,commons-lang-2.1,commons-logging,hadoop-common"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
