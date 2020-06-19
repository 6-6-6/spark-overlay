# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-common-3.2.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/hadoop/hadoop-common/3.2.1/hadoop-common-3.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-common-3.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Hadoop Common"
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-common:3.2.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-databind:2.9.8 -> >=dev-java/jackson-databind-2.11.0:2
# com.fasterxml.woodstox:woodstox-core:5.0.3 -> >=app-maven/woodstox-core-6.2.1:0
# com.google.code.findbugs:jsr305:3.0.0 -> >=dev-java/jsr305-3.0.1:0
# com.google.code.gson:gson:2.2.4 -> >=dev-java/gson-2.3.1:2.2.2
# com.google.guava:guava:27.0-jre -> >=dev-java/guava-29.0:0
# com.google.protobuf:protobuf-java:2.5.0 -> >=dev-java/protobuf-java-3.11.4:0
# com.google.re2j:re2j:1.1 -> >=app-maven/re2j-1.3:0
# com.jcraft:jsch:0.1.54 -> >=dev-java/jsch-0.1.54:0
# com.sun.jersey:jersey-core:1.19 -> >=app-maven/jersey-core-1.19.4:0
# com.sun.jersey:jersey-json:1.19 -> >=app-maven/jersey-json-1.19.4:0
# com.sun.jersey:jersey-server:1.19 -> >=app-maven/jersey-server-1.19.4:0
# com.sun.jersey:jersey-servlet:1.19 -> >=app-maven/jersey-servlet-1.19.4:0
# commons-beanutils:commons-beanutils:1.9.3 -> !!!suitble-avenVersion-not-found!!!
# commons-cli:commons-cli:1.2 -> >=dev-java/commons-cli-1.3.1:1
# commons-codec:commons-codec:1.11 -> >=dev-java/commons-codec-1.11:0
# commons-collections:commons-collections:3.2.2 -> !!!suitble-avenVersion-not-found!!!
# commons-io:commons-io:2.5 -> >=dev-java/commons-io-2.7:0
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# commons-net:commons-net:3.6 -> >=dev-java/commons-net-3.6:0
# dnsjava:dnsjava:2.1.7 -> >=dev-java/dnsjava-2.1.7:0
# javax.servlet:javax.servlet-api:3.1.0 -> >=java-virtuals/servlet-api-3.1:3.1
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.apache.avro:avro:1.7.7 -> >=app-maven/avro-1.9.2:0
# org.apache.commons:commons-compress:1.18 -> >=dev-java/commons-compress-1.20:0
# org.apache.commons:commons-configuration2:2.1.1 -> >=dev-java/commons-configuration-2.7:2
# org.apache.commons:commons-lang3:3.7 -> >=dev-java/commons-lang-3.10:3
# org.apache.commons:commons-math3:3.1.1 -> >=dev-java/commons-math-3.6.1:3
# org.apache.commons:commons-text:1.4 -> >=dev-java/commons-text-1.8:0
# org.apache.curator:curator-client:2.13.0 -> >=app-maven/curator-client-5.0.0:0
# org.apache.curator:curator-recipes:2.13.0 -> >=app-maven/curator-recipes-5.0.0:0
# org.apache.hadoop:hadoop-annotations:3.2.1 -> >=app-maven/hadoop-annotations-3.2.1:0
# org.apache.hadoop:hadoop-auth:3.2.1 -> >=app-maven/hadoop-auth-3.2.1:0
# org.apache.htrace:htrace-core4:4.1.0-incubating -> >=app-maven/htrace-core4-4.2.0:0
# org.apache.httpcomponents:httpclient:4.5.6 -> !!!suitble-avenVersion-not-found!!!
# org.apache.kerby:kerb-simplekdc:1.0.1 -> >=app-maven/kerb-simplekdc-2.0.1:0
# org.apache.zookeeper:zookeeper:3.4.13 -> >=app-maven/zookeeper-3.6.1:0
# org.codehaus.woodstox:stax2-api:3.1.4 -> >=dev-java/stax2-api-4.0.0:0
# org.eclipse.jetty:jetty-server:9.3.24.v20180605 -> >=app-maven/jetty-server-9.3.24_p20180605:0
# org.eclipse.jetty:jetty-servlet:9.3.24.v20180605 -> >=app-maven/jetty-servlet-9.3.24_p20180605:0
# org.eclipse.jetty:jetty-util:9.3.24.v20180605 -> >=app-maven/jetty-util-9.3.24_p20180605:0
# org.eclipse.jetty:jetty-webapp:9.3.24.v20180605 -> >=app-maven/jetty-webapp-9.3.24_p20180605:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-2.0.0_alpha1:0
# org.slf4j:slf4j-log4j12:1.7.25 -> !!!suitble-avenVersion-not-found!!!

CDEPEND="
	!!!suitble-avenVersion-not-found!!!
	>=app-maven/avro-1.9.2:0
	>=app-maven/curator-client-5.0.0:0
	>=app-maven/curator-recipes-5.0.0:0
	>=app-maven/hadoop-annotations-3.2.1:0
	>=app-maven/hadoop-auth-3.2.1:0
	>=app-maven/htrace-core4-4.2.0:0
	>=app-maven/jersey-core-1.19.4:0
	>=app-maven/jersey-json-1.19.4:0
	>=app-maven/jersey-server-1.19.4:0
	>=app-maven/jersey-servlet-1.19.4:0
	>=app-maven/jetty-server-9.3.24_p20180605:0
	>=app-maven/jetty-servlet-9.3.24_p20180605:0
	>=app-maven/jetty-util-9.3.24_p20180605:0
	>=app-maven/jetty-webapp-9.3.24_p20180605:0
	>=app-maven/kerb-simplekdc-2.0.1:0
	>=app-maven/re2j-1.3:0
	>=app-maven/woodstox-core-6.2.1:0
	>=app-maven/zookeeper-3.6.1:0
	>=dev-java/commons-cli-1.3.1:1
	>=dev-java/commons-codec-1.11:0
	>=dev-java/commons-compress-1.20:0
	>=dev-java/commons-configuration-2.7:2
	>=dev-java/commons-io-2.7:0
	>=dev-java/commons-lang-3.10:3
	>=dev-java/commons-logging-1.2:0
	>=dev-java/commons-math-3.6.1:3
	>=dev-java/commons-net-3.6:0
	>=dev-java/commons-text-1.8:0
	>=dev-java/dnsjava-2.1.7:0
	>=dev-java/gson-2.3.1:2.2.2
	>=dev-java/guava-29.0:0
	>=dev-java/jackson-databind-2.11.0:2
	>=dev-java/jsch-0.1.54:0
	>=dev-java/jsr305-3.0.1:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/protobuf-java-3.11.4:0
	>=dev-java/slf4j-api-2.0.0_alpha1:0
	>=dev-java/stax2-api-4.0.0:0
	>=java-virtuals/servlet-api-3.1:3.1
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.servlet.jsp:jsp-api:2.1 -> >=java-virtuals/jsp-api-2.3:2.3
RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}
	>=java-virtuals/jsp-api-2.3:2.3
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-databind-2,woodstox-core,jsr305,gson-2.2.2,guava,protobuf-java,re2j,jsch,jersey-core,jersey-json,jersey-server,jersey-servlet,!!!suitble-avenVersion-not-found!!!,commons-cli-1,commons-codec,!!!suitble-avenVersion-not-found!!!,commons-io,commons-logging,commons-net,dnsjava,servlet-api-3.1,log4j,avro,commons-compress,commons-configuration-2,commons-lang-3,commons-math-3,commons-text,curator-client,curator-recipes,hadoop-annotations,hadoop-auth,htrace-core4,!!!suitble-avenVersion-not-found!!!,kerb-simplekdc,zookeeper,stax2-api,jetty-server,jetty-servlet,jetty-util,jetty-webapp,slf4j-api,!!!suitble-avenVersion-not-found!!!,jsp-api-2.3"
