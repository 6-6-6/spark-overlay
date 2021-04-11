# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-common-2.10.1.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/2.10.1/hadoop-common-2.10.1-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/2.10.1/hadoop-common-2.10.1.jar --slot 0 --keywords "~amd64" --ebuild hadoop-common-2.10.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.hadoop:hadoop-common:2.10.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Apache Hadoop Common"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.woodstox:woodstox-core:5.0.3 -> >=dev-java/woodstox-core-5.0.3:0
# com.google.code.findbugs:jsr305:3.0.2 -> >=dev-java/jsr305-3.0.2:0
# com.google.code.gson:gson:2.2.4 -> >=dev-java/gson-2.3.1:2.2.2
# com.google.guava:guava:11.0.2 -> >=dev-java/guava-20.0:20
# com.google.protobuf:protobuf-java:2.5.0 -> >=dev-java/protobuf-java-2.5.0:0
# com.jcraft:jsch:0.1.55 -> >=dev-java/jsch-0.1.55:0
# com.sun.jersey:jersey-core:1.9 -> >=dev-java/jersey-core-1.9:1
# com.sun.jersey:jersey-json:1.9 -> >=dev-java/jersey-json-1.9:1
# com.sun.jersey:jersey-server:1.9 -> >=dev-java/jersey-server-1.9:1
# commons-beanutils:commons-beanutils:1.9.4 -> >=dev-java/commons-beanutils-1.9.4:0
# commons-cli:commons-cli:1.2 -> >=dev-java/commons-cli-1.3.1:1
# commons-codec:commons-codec:1.4 -> >=dev-java/commons-codec-1.7:0
# commons-collections:commons-collections:3.2.2 -> >=dev-java/commons-collections-3.2.2:3
# commons-configuration:commons-configuration:1.6 -> >=dev-java/commons-configuration-1.6:0
# commons-digester:commons-digester:1.8 -> >=dev-java/commons-digester-1.8.1:0
# commons-io:commons-io:2.4 -> >=dev-java/commons-io-2.4:1
# commons-lang:commons-lang:2.6 -> >=dev-java/commons-lang-2.6:2.1
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# commons-net:commons-net:3.1 -> >=dev-java/commons-net-3.2:0
# javax.servlet:servlet-api:2.5 -> java-virtuals/servlet-api:4.0
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# net.java.dev.jets3t:jets3t:0.9.0 -> >=dev-java/jets3t-0.9.0:0
# org.apache.avro:avro:1.7.7 -> >=dev-java/avro-1.8.2:0
# org.apache.commons:commons-compress:1.19 -> >=dev-java/commons-compress-1.20:0
# org.apache.commons:commons-lang3:3.4 -> >=dev-java/commons-lang-3.4:3.4
# org.apache.commons:commons-math3:3.1.1 -> >=dev-java/commons-math-3.2:3
# org.apache.curator:curator-client:2.13.0 -> >=dev-java/curator-client-2.13.0:0
# org.apache.curator:curator-recipes:2.13.0 -> >=dev-java/curator-recipes-2.13.0:0
# org.apache.hadoop:hadoop-annotations:2.10.1 -> >=dev-java/hadoop-annotations-2.10.1:0
# org.apache.hadoop:hadoop-auth:2.10.1 -> >=dev-java/hadoop-auth-2.10.1:0
# org.apache.htrace:htrace-core4:4.1.0-incubating -> >=dev-java/htrace-core4-4.1.0:0
# org.apache.httpcomponents:httpclient:4.5.2 -> >=dev-java/httpclient-4.5.6:0
# org.apache.zookeeper:zookeeper:3.4.14 -> >=dev-java/zookeeper-3.4.14:0
# org.codehaus.jackson:jackson-core-asl:1.9.13 -> >=dev-java/jackson-core-asl-1.9.13:0
# org.codehaus.jackson:jackson-mapper-asl:1.9.13 -> >=dev-java/jackson-mapper-asl-1.9.13:0
# org.codehaus.woodstox:stax2-api:3.1.4 -> >=dev-java/stax2-api-4.0.0:0
# org.mortbay.jetty:jetty:6.1.26 -> >=dev-java/jetty-6.1.26:6
# org.mortbay.jetty:jetty-sslengine:6.1.26 -> >=dev-java/jetty-sslengine-6.1.26:6
# org.mortbay.jetty:jetty-util:6.1.26 -> >=dev-java/jetty-util-6.1.26:6
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-1.7.28:0
# org.slf4j:slf4j-log4j12:1.7.25 -> >=dev-java/slf4j-log4j12-1.7.28:0
# xmlenc:xmlenc:0.52 -> >=dev-java/xmlenc-0.52:0

CDEPEND="
	>=dev-java/avro-1.8.2:0
	>=dev-java/commons-beanutils-1.9.4:0
	>=dev-java/commons-cli-1.3.1:1
	>=dev-java/commons-codec-1.7:0
	>=dev-java/commons-collections-3.2.2:3
	>=dev-java/commons-compress-1.20:0
	>=dev-java/commons-configuration-1.6:0
	>=dev-java/commons-digester-1.8.1:0
	>=dev-java/commons-io-2.4:1
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/commons-lang-3.4:3.4
	>=dev-java/commons-logging-1.2:0
	>=dev-java/commons-math-3.2:3
	>=dev-java/commons-net-3.2:0
	>=dev-java/curator-client-2.13.0:0
	>=dev-java/curator-recipes-2.13.0:0
	>=dev-java/gson-2.3.1:2.2.2
	>=dev-java/guava-20.0:20
	>=dev-java/hadoop-annotations-2.10.1:0
	>=dev-java/hadoop-auth-2.10.1:0
	>=dev-java/htrace-core4-4.1.0:0
	>=dev-java/httpclient-4.5.6:0
	>=dev-java/jackson-core-asl-1.9.13:0
	>=dev-java/jackson-mapper-asl-1.9.13:0
	>=dev-java/jersey-core-1.9:1
	>=dev-java/jersey-json-1.9:1
	>=dev-java/jersey-server-1.9:1
	>=dev-java/jets3t-0.9.0:0
	>=dev-java/jetty-6.1.26:6
	>=dev-java/jetty-sslengine-6.1.26:6
	>=dev-java/jetty-util-6.1.26:6
	>=dev-java/jsch-0.1.55:0
	>=dev-java/jsr305-3.0.2:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/protobuf-java-2.5.0:0
	>=dev-java/slf4j-api-1.7.28:0
	>=dev-java/slf4j-log4j12-1.7.28:0
	>=dev-java/stax2-api-4.0.0:0
	>=dev-java/woodstox-core-5.0.3:0
	>=dev-java/xmlenc-0.52:0
	>=dev-java/zookeeper-3.4.14:0
	java-virtuals/servlet-api:4.0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.ant:ant:1.8.1 -> >=dev-java/ant-core-1.10.9:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/ant-core-1.10.9:0
	)
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.servlet.jsp:jsp-api:2.1 -> java-virtuals/jsp-api:2.3

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
	java-virtuals/jsp-api:2.3
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="woodstox-core,jsr305,gson-2.2.2,guava-20,protobuf-java,jsch,jersey-core-1,jersey-json-1,jersey-server-1,commons-beanutils,commons-cli-1,commons-codec,commons-collections-3,commons-configuration,commons-digester,commons-io-1,commons-lang-2.1,commons-logging,commons-net,servlet-api-4.0,log4j,jets3t,avro,commons-compress,commons-lang-3.4,commons-math-3,curator-client,curator-recipes,hadoop-annotations,hadoop-auth,htrace-core4,httpclient,zookeeper,jackson-core-asl,jackson-mapper-asl,stax2-api,jetty-6,jetty-sslengine-6,jetty-util-6,slf4j-api,slf4j-log4j12,xmlenc,jsp-api-2.3"
JAVA_CLASSPATH_EXTRA="ant-core"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
