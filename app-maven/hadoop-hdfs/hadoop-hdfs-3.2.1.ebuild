# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-hdfs-3.2.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/hadoop/hadoop-hdfs/3.2.1/hadoop-hdfs-3.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-hdfs-3.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Hadoop HDFS"
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-hdfs:3.2.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-databind:2.9.8 -> >=dev-java/jackson-databind-2.11.0:0
# com.google.guava:guava:27.0-jre -> >=dev-java/guava-20.0:20
# com.google.protobuf:protobuf-java:2.5.0 -> >=app-maven/protobuf-java-3.12.2:0
# com.sun.jersey:jersey-core:1.19 -> >=app-maven/jersey-core-1.19.4:0
# com.sun.jersey:jersey-server:1.19 -> >=app-maven/jersey-server-1.19.4:0
# commons-cli:commons-cli:1.2 -> >=dev-java/commons-cli-1.4:1
# commons-codec:commons-codec:1.11 -> >=dev-java/commons-codec-1.7:0
# commons-daemon:commons-daemon:1.0.13 -> >=dev-java/commons-daemon-1.0.15:0
# commons-io:commons-io:2.5 -> >=dev-java/commons-io-2.4:1
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# io.netty:netty:3.10.5.Final -> >=app-maven/netty-4.0.0:0
# io.netty:netty-all:4.0.52.Final -> >=app-maven/netty-all-5.0.0:0
# javax.servlet:javax.servlet-api:3.1.0 -> >=java-virtuals/servlet-api-2.3:2.3
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.apache.htrace:htrace-core4:4.1.0-incubating -> >=app-maven/htrace-core4-4.2.0:0
# org.eclipse.jetty:jetty-server:9.3.24.v20180605 -> >=app-maven/jetty-server-9.3.24_p20180605:0
# org.eclipse.jetty:jetty-util:9.3.24.v20180605 -> >=app-maven/jetty-util-9.3.24_p20180605:0
# org.eclipse.jetty:jetty-util-ajax:9.3.24.v20180605 -> >=app-maven/jetty-util-ajax-9.3.24_p20180605:0
# org.fusesource.leveldbjni:leveldbjni-all:1.8 -> >=dev-java/leveldbjni-all-1.8:0

CDEPEND="
	>=app-maven/htrace-core4-4.2.0:0
	>=app-maven/jersey-core-1.19.4:0
	>=app-maven/jersey-server-1.19.4:0
	>=app-maven/jetty-server-9.3.24_p20180605:0
	>=app-maven/jetty-util-9.3.24_p20180605:0
	>=app-maven/jetty-util-ajax-9.3.24_p20180605:0
	>=app-maven/netty-4.0.0:0
	>=app-maven/netty-all-5.0.0:0
	>=app-maven/protobuf-java-3.12.2:0
	>=dev-java/commons-cli-1.4:1
	>=dev-java/commons-codec-1.7:0
	>=dev-java/commons-daemon-1.0.15:0
	>=dev-java/commons-io-2.4:1
	>=dev-java/commons-logging-1.2:0
	>=dev-java/guava-20.0:20
	>=dev-java/jackson-databind-2.11.0:0
	>=dev-java/leveldbjni-all-1.8:0
	>=dev-java/log4j-1.2.17:0
	>=java-virtuals/servlet-api-2.3:2.3
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-annotations:3.2.1 -> >=app-maven/hadoop-annotations-3.2.1:0
# org.apache.hadoop:hadoop-auth:3.2.1 -> >=app-maven/hadoop-auth-3.2.1:0
# org.apache.hadoop:hadoop-common:3.2.1 -> >=app-maven/hadoop-common-3.2.1:0
# org.apache.hadoop:hadoop-hdfs-client:3.2.1 -> >=app-maven/hadoop-hdfs-client-3.2.1:0
# org.slf4j:slf4j-log4j12:1.7.25 -> >=dev-java/slf4j-api-1.7.7:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/hadoop-annotations-3.2.1:0
	>=app-maven/hadoop-auth-3.2.1:0
	>=app-maven/hadoop-common-3.2.1:0
	>=app-maven/hadoop-hdfs-client-3.2.1:0
	>=dev-java/slf4j-api-1.7.7:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-databind,guava-20,protobuf-java,jersey-core,jersey-server,commons-cli-1,commons-codec,commons-daemon,commons-io-1,commons-logging,netty,netty-all,servlet-api-2.3,log4j,htrace-core4,jetty-server,jetty-util,jetty-util-ajax,leveldbjni-all"
JAVA_GENTOO_CLASSPATH_EXTRA="hadoop-annotations,hadoop-auth,hadoop-common,hadoop-hdfs-client,slf4j-api"
