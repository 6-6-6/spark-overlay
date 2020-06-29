# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-mapreduce-client-core-2.5.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/hadoop/hadoop-mapreduce-client-core/2.5.1/hadoop-mapreduce-client-core-2.5.1-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-mapreduce-client-core-2.5.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Hadoop Project POM"
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-mapreduce-client-core:2.5.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.inject.extensions:guice-servlet:3.0 -> >=dev-java/guice-4.1:4
# com.google.protobuf:protobuf-java:2.5.0 -> >=dev-java/protobuf-java-3.11.4:0
# io.netty:netty:3.6.2.Final -> >=app-maven/netty-3.7.0:0
# org.apache.avro:avro:1.7.4 -> >=app-maven/avro-1.7.4:0
# org.apache.hadoop:hadoop-annotations:2.5.1 -> >=app-maven/hadoop-annotations-2.6.0:0
# org.apache.hadoop:hadoop-yarn-common:2.5.1 -> >=app-maven/hadoop-yarn-common-2.5.1:0
# org.slf4j:slf4j-api:1.7.5 -> >=dev-java/slf4j-ext-1.7.5:0
# org.slf4j:slf4j-log4j12:1.7.5 -> >=dev-java/slf4j-ext-1.7.5:0

CDEPEND="
	>=app-maven/avro-1.7.4:0
	>=app-maven/hadoop-annotations-2.6.0:0
	>=app-maven/hadoop-yarn-common-2.5.1:0
	>=app-maven/netty-3.7.0:0
	>=dev-java/guice-4.1:4
	>=dev-java/protobuf-java-3.11.4:0
	>=dev-java/slf4j-ext-1.7.5:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava:11.0.2 -> >=dev-java/guava-20.0:0
# commons-cli:commons-cli:1.2 -> >=dev-java/commons-cli-1.3.1:1
# commons-codec:commons-codec:1.4 -> >=dev-java/commons-codec-1.7:0
# commons-collections:commons-collections:3.2.1 -> >=dev-java/commons-collections-3.2.1:0
# commons-lang:commons-lang:2.6 -> >=dev-java/commons-lang-2.6:2.1
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# org.apache.hadoop:hadoop-common:2.5.1 -> >=app-maven/hadoop-common-2.6.0:0

DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/hadoop-common-2.6.0:0
	>=dev-java/commons-cli-1.3.1:1
	>=dev-java/commons-codec-1.7:0
	>=dev-java/commons-collections-3.2.1:0
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/commons-logging-1.2:0
	>=dev-java/guava-20.0:0
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guice-4,protobuf-java,netty,avro,hadoop-annotations,hadoop-yarn-common,slf4j-ext,slf4j-ext"
JAVA_CLASSPATH_EXTRA="guava-${PV%.*},commons-cli-1,commons-codec,commons-collections,commons-lang-2.1,commons-logging,hadoop-common"
