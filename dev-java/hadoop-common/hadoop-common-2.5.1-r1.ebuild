# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-common-2.5.1.pom --download-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/2.5.1/hadoop-common-2.5.1-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-common-2.5.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Apache Hadoop Common"
HOMEPAGE=""
SRC_URI="https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-common:2.5.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.findbugs:jsr305:1.3.9 -> >=dev-java/jsr305-3.0.1:0
# com.google.guava:guava:11.0.2 -> >=dev-java/guava-29.0:0
# com.google.protobuf:protobuf-java:2.5.0 -> >=dev-java/protobuf-java-3.11.4:0
# com.jcraft:jsch:0.1.42 -> >=dev-java/jsch-0.1.52:0
# com.sun.jersey:jersey-core:1.9 -> >=dev-java/jersey-core-1.9:1
# com.sun.jersey:jersey-json:1.9 -> >=dev-java/jersey-json-1.9:1
# com.sun.jersey:jersey-server:1.9 -> >=dev-java/jersey-server-1.9:1
# commons-cli:commons-cli:1.2 -> >=dev-java/commons-cli-1.3.1:1
# commons-codec:commons-codec:1.4 -> >=dev-java/commons-codec-1.7:0
# commons-collections:commons-collections:3.2.1 -> >=dev-java/commons-collections-3.2.1:0
# commons-configuration:commons-configuration:1.6 -> >=dev-java/commons-configuration-1.6:0
# commons-httpclient:commons-httpclient:3.1 -> >=dev-java/commons-httpclient-3.1:3
# commons-io:commons-io:2.4 -> >=dev-java/commons-io-2.4:1
# commons-lang:commons-lang:2.6 -> >=dev-java/commons-lang-2.6:2.1
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# commons-net:commons-net:3.1 -> >=dev-java/commons-net-3.2:0
# javax.servlet:servlet-api:2.5 -> java-virtuals/servlet-api:4.0
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# net.java.dev.jets3t:jets3t:0.9.0 -> >=dev-java/jets3t-0.9.0:0
# org.apache.avro:avro:1.7.4 -> >=dev-java/avro-1.8.2:0
# org.apache.commons:commons-compress:1.4.1 -> >=dev-java/commons-compress-1.10:0
# org.apache.commons:commons-math3:3.1.1 -> >=dev-java/commons-math-3.2:3
# org.apache.hadoop:hadoop-annotations:2.5.1 -> >=dev-java/hadoop-annotations-2.5.1:0
# org.apache.hadoop:hadoop-auth:2.5.1 -> >=dev-java/hadoop-auth-2.5.1:0
# org.apache.zookeeper:zookeeper:3.4.6 -> >=dev-java/zookeeper-3.4.6:0
# org.codehaus.jackson:jackson-core-asl:1.9.13 -> >=dev-java/jackson-core-asl-1.9.13:0
# org.codehaus.jackson:jackson-mapper-asl:1.9.13 -> >=dev-java/jackson-mapper-asl-1.9.13:0
# org.mortbay.jetty:jetty:6.1.26 -> >=dev-java/jetty-6.1.26:6
# org.mortbay.jetty:jetty-util:6.1.26 -> >=dev-java/jetty-util-6.1.26:6
# org.slf4j:slf4j-api:1.7.5 -> >=dev-java/slf4j-api-1.7.7:0
# xmlenc:xmlenc:0.52 -> >=dev-java/xmlenc-0.52:0

CDEPEND="
	>=dev-java/avro-1.8.2:0
	>=dev-java/hadoop-annotations-2.5.1:0
	>=dev-java/hadoop-auth-2.5.1:0
	>=dev-java/jackson-core-asl-1.9.13:0
	>=dev-java/jackson-mapper-asl-1.9.13:0
	>=dev-java/jersey-core-1.9:1
	>=dev-java/jersey-json-1.9:1
	>=dev-java/jersey-server-1.9:1
	>=dev-java/jets3t-0.9.0:0
	>=dev-java/jetty-6.1.26:6
	>=dev-java/jetty-util-6.1.26:6
	>=dev-java/xmlenc-0.52:0
	>=dev-java/zookeeper-3.4.6:0
	>=dev-java/commons-cli-1.3.1:1
	>=dev-java/commons-codec-1.7:0
	>=dev-java/commons-collections-3.2.1:0
	>=dev-java/commons-compress-1.10:0
	>=dev-java/commons-configuration-1.6:0
	>=dev-java/commons-httpclient-3.1:3
	>=dev-java/commons-io-2.4:1
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/commons-logging-1.2:0
	>=dev-java/commons-math-3.2:3
	>=dev-java/commons-net-3.2:0
	>=dev-java/guava-29.0:0
	>=dev-java/jsch-0.1.52:0
	>=dev-java/jsr305-3.0.1:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/protobuf-java-3.11.4:0
	>=dev-java/slf4j-api-1.7.7:0
	java-virtuals/servlet-api:4.0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.ant:ant:1.8.1 -> >=dev-java/ant-core-1.10.7:0

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/ant-core-1.10.7:0
	)
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# commons-el:commons-el:1.0 -> >=dev-java/commons-el-1.0:0
# javax.servlet.jsp:jsp-api:2.1 -> java-virtuals/jsp-api:2.3
# org.slf4j:slf4j-log4j12:1.7.5 -> >=dev-java/slf4j-log4j12-1.7.7:0
# tomcat:jasper-compiler:5.5.23 -> >=dev-java/jasper-compiler-5.5.23:0
# tomcat:jasper-runtime:5.5.23 -> >=dev-java/jasper-runtime-5.5.23:0
RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}
	>=dev-java/jasper-compiler-5.5.23:0

	>=dev-java/jasper-runtime-5.5.23:0

	>=dev-java/commons-el-1.0:0

	>=dev-java/slf4j-log4j12-1.7.7:0

	java-virtuals/jsp-api:2.3
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jsr305,guava,protobuf-java,jsch,jersey-core-1,jersey-json-1,jersey-server-1,commons-cli-1,commons-codec,commons-collections,commons-configuration,commons-httpclient-3,commons-io-1,commons-lang-2.1,commons-logging,commons-net,servlet-api-4.0,log4j,jets3t,avro,commons-compress,commons-math-3,hadoop-annotations,hadoop-auth,zookeeper,jackson-core-asl,jackson-mapper-asl,jetty-6,jetty-util-6,slf4j-api,xmlenc,commons-el,jsp-api-2.3,slf4j-log4j12,jasper-compiler,jasper-runtime"
JAVA_CLASSPATH_EXTRA="ant-core"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

