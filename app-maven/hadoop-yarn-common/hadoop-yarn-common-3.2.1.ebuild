# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-yarn-common-3.2.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/hadoop/hadoop-yarn-common/3.2.1/hadoop-yarn-common-3.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-yarn-common-3.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Hadoop Project POM"
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-yarn-common:3.2.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-core:2.9.8 -> >=dev-java/jackson-2.9.10:2
# com.fasterxml.jackson.core:jackson-databind:2.9.8 -> >=dev-java/jackson-databind-2.11.0:2
# com.fasterxml.jackson.jaxrs:jackson-jaxrs-json-provider:2.9.8 -> >=app-maven/jackson-jaxrs-json-provider-2.11.0:0
# com.fasterxml.jackson.module:jackson-module-jaxb-annotations:2.9.8 -> >=app-maven/jackson-module-jaxb-annotations-2.11.0:0
# com.google.guava:guava:27.0-jre -> >=dev-java/guava-29.0:0
# com.google.inject:guice:4.0 -> >=dev-java/guice-4.1:4
# com.google.inject.extensions:guice-servlet:4.0 -> >=dev-java/guice-4.1:4
# com.google.protobuf:protobuf-java:2.5.0 -> >=dev-java/protobuf-java-3.11.4:0
# com.sun.jersey:jersey-client:1.19 -> >=app-maven/jersey-client-1.19.4:0
# com.sun.jersey:jersey-core:1.19 -> >=app-maven/jersey-core-1.19.4:0
# com.sun.jersey:jersey-json:1.19 -> >=app-maven/jersey-json-1.19.4:0
# com.sun.jersey:jersey-server:1.19 -> >=app-maven/jersey-server-1.19.4:0
# com.sun.jersey.contribs:jersey-guice:1.19 -> >=app-maven/jersey-guice-1.19.4:0
# commons-cli:commons-cli:1.2 -> >=dev-java/commons-cli-1.3.1:1
# commons-codec:commons-codec:1.11 -> >=dev-java/commons-codec-1.11:0
# commons-io:commons-io:2.5 -> >=dev-java/commons-io-2.7:0
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# javax.servlet:javax.servlet-api:3.1.0 -> >=java-virtuals/servlet-api-3.1:3.1
# javax.xml.bind:jaxb-api:2.2.11 -> >=app-maven/jaxb-api-2.4.0.180830.0359:0
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.apache.commons:commons-compress:1.18 -> >=dev-java/commons-compress-1.20:0
# org.apache.hadoop:hadoop-annotations:3.2.1 -> >=app-maven/hadoop-annotations-3.2.1:0
# org.apache.hadoop:hadoop-auth:3.2.1 -> >=app-maven/hadoop-auth-3.2.1:0
# org.apache.hadoop:hadoop-hdfs-client:3.2.1 -> >=app-maven/hadoop-hdfs-client-3.2.1:0
# org.apache.hadoop:hadoop-yarn-api:3.2.1 -> >=app-maven/hadoop-yarn-api-3.2.1:0
# org.eclipse.jetty:jetty-util:9.3.24.v20180605 -> >=app-maven/jetty-util-9.3.24_p20180605:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-2.0.0_alpha1:0

CDEPEND="
	>=app-maven/hadoop-annotations-3.2.1:0
	>=app-maven/hadoop-auth-3.2.1:0
	>=app-maven/hadoop-hdfs-client-3.2.1:0
	>=app-maven/hadoop-yarn-api-3.2.1:0
	>=app-maven/jackson-jaxrs-json-provider-2.11.0:0
	>=app-maven/jackson-module-jaxb-annotations-2.11.0:0
	>=app-maven/jaxb-api-2.4.0.180830.0359:0
	>=app-maven/jersey-client-1.19.4:0
	>=app-maven/jersey-core-1.19.4:0
	>=app-maven/jersey-guice-1.19.4:0
	>=app-maven/jersey-json-1.19.4:0
	>=app-maven/jersey-server-1.19.4:0
	>=app-maven/jetty-util-9.3.24_p20180605:0
	>=dev-java/commons-cli-1.3.1:1
	>=dev-java/commons-codec-1.11:0
	>=dev-java/commons-compress-1.20:0
	>=dev-java/commons-io-2.7:0
	>=dev-java/commons-logging-1.2:0
	>=dev-java/guava-29.0:0
	>=dev-java/guice-4.1:4
	>=dev-java/jackson-2.9.10:2
	>=dev-java/jackson-databind-2.11.0:2
	>=dev-java/log4j-1.2.17:0
	>=dev-java/protobuf-java-3.11.4:0
	>=dev-java/slf4j-api-2.0.0_alpha1:0
	>=java-virtuals/servlet-api-3.1:3.1
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-common:3.2.1 -> >=app-maven/hadoop-common-3.2.1:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/hadoop-common-3.2.1:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-2,jackson-databind-2,jackson-jaxrs-json-provider,jackson-module-jaxb-annotations,guava,guice-4,guice-4,protobuf-java,jersey-client,jersey-core,jersey-json,jersey-server,jersey-guice,commons-cli-1,commons-codec,commons-io,commons-logging,servlet-api-3.1,jaxb-api,log4j,commons-compress,hadoop-annotations,hadoop-auth,hadoop-hdfs-client,hadoop-yarn-api,jetty-util,slf4j-api"
JAVA_CLASSPATH_EXTRA="hadoop-common"
