# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-hdfs-2.7.4.pom --download-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-hdfs/2.7.4/hadoop-hdfs-2.7.4-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-hdfs-2.7.4-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Apache Hadoop HDFS"
HOMEPAGE=""
SRC_URI="https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-hdfs:2.7.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava:11.0.2 -> >=dev-java/guava-29.0:0
# com.google.protobuf:protobuf-java:2.5.0 -> >=dev-java/protobuf-java-3.11.4:0
# com.sun.jersey:jersey-core:1.9 -> >=dev-java/jersey-core-1.9:1
# com.sun.jersey:jersey-server:1.9 -> >=dev-java/jersey-server-1.9:1
# commons-cli:commons-cli:1.2 -> >=dev-java/commons-cli-1.3.1:1
# commons-codec:commons-codec:1.4 -> >=dev-java/commons-codec-1.7:0
# commons-daemon:commons-daemon:1.0.13 -> >=dev-java/commons-daemon-1.0.15:0
# commons-io:commons-io:2.4 -> >=dev-java/commons-io-2.4:1
# commons-lang:commons-lang:2.6 -> >=dev-java/commons-lang-2.6:2.1
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# io.netty:netty:3.6.2.Final -> >=dev-java/netty-3.7.0:0
# io.netty:netty-all:4.0.23.Final -> >=dev-java/netty-all-5.0.0:0
# javax.servlet:servlet-api:2.5 -> java-virtuals/servlet-api:4.0
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.apache.htrace:htrace-core:3.1.0-incubating -> >=dev-java/htrace-core-3.1.0:0
# org.codehaus.jackson:jackson-core-asl:1.9.13 -> >=dev-java/jackson-core-asl-1.9.13:0
# org.codehaus.jackson:jackson-mapper-asl:1.9.13 -> >=dev-java/jackson-mapper-asl-1.9.13:0
# org.fusesource.leveldbjni:leveldbjni-all:1.8 -> >=dev-java/leveldbjni-1.8:0
# org.mortbay.jetty:jetty:6.1.26 -> >=dev-java/jetty-6.1.26:6
# org.mortbay.jetty:jetty-util:6.1.26 -> >=dev-java/jetty-util-6.1.26:6
# xerces:xercesImpl:2.9.1 -> >=dev-java/xerces-2.12.0:2
# xmlenc:xmlenc:0.52 -> >=dev-java/xmlenc-0.52:0

CDEPEND="
	>=dev-java/htrace-core-3.1.0:0
	>=dev-java/jackson-core-asl-1.9.13:0
	>=dev-java/jackson-mapper-asl-1.9.13:0
	>=dev-java/jersey-core-1.9:1
	>=dev-java/jersey-server-1.9:1
	>=dev-java/jetty-6.1.26:6
	>=dev-java/jetty-util-6.1.26:6
	>=dev-java/netty-3.7.0:0
	>=dev-java/xmlenc-0.52:0
	>=dev-java/commons-cli-1.3.1:1
	>=dev-java/commons-codec-1.7:0
	>=dev-java/commons-daemon-1.0.15:0
	>=dev-java/commons-io-2.4:1
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/commons-logging-1.2:0
	>=dev-java/guava-29.0:0
	>=dev-java/leveldbjni-1.8:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/netty-all-5.0.0:0
	>=dev-java/protobuf-java-3.11.4:0
	>=dev-java/xerces-2.12.0:2
	java-virtuals/servlet-api:4.0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-annotations:2.7.4 -> >=dev-java/hadoop-annotations-2.7.4:0
# org.apache.hadoop:hadoop-auth:2.7.4 -> >=dev-java/hadoop-auth-2.7.4:0
# org.apache.hadoop:hadoop-common:2.7.4 -> >=dev-java/hadoop-common-2.7.4:0
# org.slf4j:slf4j-log4j12:1.7.10 -> >=dev-java/slf4j-log4j12-1.7.28:0

DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/hadoop-annotations-2.7.4:0
	>=dev-java/hadoop-auth-2.7.4:0
	>=dev-java/hadoop-common-2.7.4:0
	>=dev-java/slf4j-log4j12-1.7.28:0
	)
"

RDEPEND="
	>=virtual/jre-1.7:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guava,protobuf-java,jersey-core-1,jersey-server-1,commons-cli-1,commons-codec,commons-daemon,commons-io-1,commons-lang-2.1,commons-logging,netty,netty-all,servlet-4.0,log4j,htrace-core,jackson-core-asl,jackson-mapper-asl,leveldbjni,jetty-6,jetty-util-6,xerces-2,xmlenc"
JAVA_CLASSPATH_EXTRA="hadoop-annotations,hadoop-auth,hadoop-common,slf4j-log4j12"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

