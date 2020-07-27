# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-hdfs-2.5.1.pom --download-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-hdfs/2.5.1/hadoop-hdfs-2.5.1-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-hdfs-2.5.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Hadoop HDFS"
HOMEPAGE=""
SRC_URI="https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-hdfs:2.5.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava:11.0.2 -> >=dev-java/guava-29.0:0
# com.google.protobuf:protobuf-java:2.5.0 -> >=dev-java/protobuf-java-3.11.4:0
# com.sun.jersey:jersey-core:1.9 -> >=app-maven/jersey-core-1.9:1
# com.sun.jersey:jersey-server:1.9 -> >=app-maven/jersey-server-1.9:1
# commons-cli:commons-cli:1.2 -> >=dev-java/commons-cli-1.3.1:1
# commons-codec:commons-codec:1.4 -> >=dev-java/commons-codec-1.7:0
# commons-daemon:commons-daemon:1.0.13 -> >=dev-java/commons-daemon-1.0.15:0
# commons-io:commons-io:2.4 -> >=dev-java/commons-io-2.4:1
# commons-lang:commons-lang:2.6 -> >=dev-java/commons-lang-2.6:2.1
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# io.netty:netty:3.6.2.Final -> >=app-maven/netty-3.7.0:0
# javax.servlet:servlet-api:2.5 -> java-virtuals/servlet-api:4.0
# javax.servlet.jsp:jsp-api:2.1 -> java-virtuals/jsp-api:2.3
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.codehaus.jackson:jackson-core-asl:1.9.13 -> >=app-maven/jackson-core-asl-1.9.13:0
# org.codehaus.jackson:jackson-mapper-asl:1.9.13 -> >=app-maven/jackson-mapper-asl-1.9.13:0
# org.mortbay.jetty:jetty:6.1.26 -> >=app-maven/jetty-6.1.26:6
# org.mortbay.jetty:jetty-util:6.1.26 -> >=app-maven/jetty-util-6.1.26:6
# tomcat:jasper-runtime:5.5.23 -> >=app-maven/jasper-runtime-5.5.23:0
# xmlenc:xmlenc:0.52 -> >=app-maven/xmlenc-0.52:0

CDEPEND="
	>=app-maven/jackson-core-asl-1.9.13:0
	>=app-maven/jackson-mapper-asl-1.9.13:0
	>=app-maven/jasper-runtime-5.5.23:0
	>=app-maven/jersey-core-1.9:1
	>=app-maven/jersey-server-1.9:1
	>=app-maven/jetty-6.1.26:6
	>=app-maven/jetty-util-6.1.26:6
	>=app-maven/netty-3.7.0:0
	>=app-maven/xmlenc-0.52:0
	>=dev-java/commons-cli-1.3.1:1
	>=dev-java/commons-codec-1.7:0
	>=dev-java/commons-daemon-1.0.15:0
	>=dev-java/commons-io-2.4:1
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/commons-logging-1.2:0
	>=dev-java/guava-29.0:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/protobuf-java-3.11.4:0
	java-virtuals/jsp-api:2.3
	java-virtuals/servlet-api:4.0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-annotations:2.5.1 -> >=app-maven/hadoop-annotations-2.5.1:0
# org.apache.hadoop:hadoop-auth:2.5.1 -> >=app-maven/hadoop-auth-2.5.1:0
# org.apache.hadoop:hadoop-common:2.5.1 -> >=app-maven/hadoop-common-2.5.1:0
# org.slf4j:slf4j-log4j12:1.7.5 -> >=dev-java/slf4j-log4j12-1.7.7:0

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=app-maven/hadoop-annotations-2.5.1:0
	>=app-maven/hadoop-auth-2.5.1:0
	>=app-maven/hadoop-common-2.5.1:0
	>=dev-java/slf4j-log4j12-1.7.7:0
	)
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guava,protobuf-java,jersey-core-1,jersey-server-1,commons-cli-1,commons-codec,commons-daemon,commons-io-1,commons-lang-2.1,commons-logging,netty,servlet-4.0,jsp-2.3,log4j,jackson-core-asl,jackson-mapper-asl,jetty-6,jetty-util-6,jasper-runtime,xmlenc"
JAVA_CLASSPATH_EXTRA="hadoop-annotations,hadoop-auth,hadoop-common,slf4j-log4j12"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip -q "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
