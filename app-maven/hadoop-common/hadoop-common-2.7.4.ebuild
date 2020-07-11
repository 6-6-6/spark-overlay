# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-common-2.7.4.pom --download-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/2.7.4/hadoop-common-2.7.4-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-common-2.7.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Hadoop Common"
HOMEPAGE=""
SRC_URI="https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-common:2.7.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.findbugs:jsr305:3.0.0 -> >=dev-java/jsr305-3.0.1:0
# com.google.code.gson:gson:2.2.4 -> >=dev-java/gson-2.3.1:2.2.2
# com.google.guava:guava:11.0.2 -> >=dev-java/guava-29.0:0
# com.google.protobuf:protobuf-java:2.5.0 -> >=dev-java/protobuf-java-3.11.4:0
# com.jcraft:jsch:0.1.54 -> >=dev-java/jsch-0.1.54:0
# com.sun.jersey:jersey-core:1.9 -> >=app-maven/jersey-core-1.9:0
# com.sun.jersey:jersey-json:1.9 -> >=app-maven/jersey-json-1.9:0
# com.sun.jersey:jersey-server:1.9 -> >=app-maven/jersey-server-1.9:0
# commons-cli:commons-cli:1.2 -> >=dev-java/commons-cli-1.3.1:1
# commons-codec:commons-codec:1.4 -> >=dev-java/commons-codec-1.7:0
# commons-collections:commons-collections:3.2.2 -> >=dev-java/commons-collections-3.2.2:3
# commons-configuration:commons-configuration:1.6 -> >=dev-java/commons-configuration-1.6:0
# commons-httpclient:commons-httpclient:3.1 -> >=dev-java/commons-httpclient-3.1:3
# commons-io:commons-io:2.4 -> >=dev-java/commons-io-2.4:1
# commons-lang:commons-lang:2.6 -> >=dev-java/commons-lang-2.6:2.1
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# commons-net:commons-net:3.1 -> >=dev-java/commons-net-3.2:0
# javax.servlet:servlet-api:2.5 -> >=java-virtuals/servlet-api-4.0:4.0
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# net.java.dev.jets3t:jets3t:0.9.0 -> >=app-maven/jets3t-0.9.0:0
# org.apache.avro:avro:1.7.4 -> >=app-maven/avro-1.8.2:0
# org.apache.commons:commons-compress:1.4.1 -> >=dev-java/commons-compress-1.10:0
# org.apache.commons:commons-math3:3.1.1 -> >=dev-java/commons-math-3.2:3
# org.apache.curator:curator-client:2.7.1 -> >=app-maven/curator-client-2.7.1:0
# org.apache.curator:curator-recipes:2.7.1 -> >=app-maven/curator-recipes-2.7.1:0
# org.apache.hadoop:hadoop-annotations:2.7.4 -> >=app-maven/hadoop-annotations-2.7.4:0
# org.apache.hadoop:hadoop-auth:2.7.4 -> >=app-maven/hadoop-auth-2.7.4:0
# org.apache.htrace:htrace-core:3.1.0-incubating -> >=app-maven/htrace-core-3.1.0:0
# org.apache.zookeeper:zookeeper:3.4.6 -> >=app-maven/zookeeper-3.4.6:0
# org.codehaus.jackson:jackson-core-asl:1.9.13 -> >=app-maven/jackson-core-asl-1.9.13:0
# org.codehaus.jackson:jackson-mapper-asl:1.9.13 -> >=app-maven/jackson-mapper-asl-1.9.13:0
# org.mortbay.jetty:jetty:6.1.26 -> >=app-maven/jetty-6.1.26:6
# org.mortbay.jetty:jetty-sslengine:6.1.26 -> >=app-maven/jetty-sslengine-6.1.26:6
# org.mortbay.jetty:jetty-util:6.1.26 -> >=app-maven/jetty-util-6.1.26:6
# org.slf4j:slf4j-api:1.7.10 -> >=dev-java/slf4j-api-1.7.28:0
# xmlenc:xmlenc:0.52 -> >=app-maven/xmlenc-0.52:0

CDEPEND="
	>=app-maven/avro-1.8.2:0
	>=app-maven/curator-client-2.7.1:0
	>=app-maven/curator-recipes-2.7.1:0
	>=app-maven/hadoop-annotations-2.7.4:0
	>=app-maven/hadoop-auth-2.7.4:0
	>=app-maven/htrace-core-3.1.0:0
	>=app-maven/jackson-core-asl-1.9.13:0
	>=app-maven/jackson-mapper-asl-1.9.13:0
	>=app-maven/jersey-core-1.9:0
	>=app-maven/jersey-json-1.9:0
	>=app-maven/jersey-server-1.9:0
	>=app-maven/jets3t-0.9.0:0
	>=app-maven/jetty-6.1.26:6
	>=app-maven/jetty-sslengine-6.1.26:6
	>=app-maven/jetty-util-6.1.26:6
	>=app-maven/xmlenc-0.52:0
	>=app-maven/zookeeper-3.4.6:0
	>=dev-java/commons-cli-1.3.1:1
	>=dev-java/commons-codec-1.7:0
	>=dev-java/commons-collections-3.2.2:3
	>=dev-java/commons-compress-1.10:0
	>=dev-java/commons-configuration-1.6:0
	>=dev-java/commons-httpclient-3.1:3
	>=dev-java/commons-io-2.4:1
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/commons-logging-1.2:0[log4j]
	>=dev-java/commons-math-3.2:3
	>=dev-java/commons-net-3.2:0
	>=dev-java/gson-2.3.1:2.2.2
	>=dev-java/guava-29.0:0
	>=dev-java/jsch-0.1.54:0
	>=dev-java/jsr305-3.0.1:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/protobuf-java-3.11.4:0
	>=dev-java/slf4j-api-1.7.28:0
	java-virtuals/servlet-api:4.0
	app-maven/jersey-container-servlet-core:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.ant:ant:1.8.1 -> >=dev-java/ant-core-1.10.7:0

DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/ant-core-1.10.7:0
	)
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.servlet.jsp:jsp-api:2.1 -> >=java-virtuals/jsp-api-2.3:2.3
# org.slf4j:slf4j-log4j12:1.7.10 -> >=dev-java/slf4j-log4j12-1.7.28:0
RDEPEND="
	>=virtual/jre-1.7:*
${CDEPEND}
	>=dev-java/slf4j-log4j12-1.7.28:0

	java-virtuals/jsp-api:2.3
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jsr305,gson-2.2.2,guava,protobuf-java,jsch,jersey-core,jersey-json,jersey-server,commons-cli-1,commons-codec,commons-collections-3,commons-configuration,commons-httpclient-3,commons-io-1,commons-lang-2.1,commons-logging,commons-net,servlet-api-4.0,log4j,jets3t,avro,commons-compress,commons-math-3,curator-client,curator-recipes,hadoop-annotations,hadoop-auth,htrace-core,zookeeper,jackson-core-asl,jackson-mapper-asl,jetty-6,jetty-sslengine-6,jetty-util-6,slf4j-api,xmlenc,jsp-api-2.3,slf4j-log4j12,jersey-container-servlet-core"
JAVA_CLASSPATH_EXTRA="ant-core"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )

	sed -i "s/com.sun.jersey.spi.container/org.glassfish.jersey/" ${S}/src/main/java/org/apache/hadoop/http/HttpServer* || die
}
