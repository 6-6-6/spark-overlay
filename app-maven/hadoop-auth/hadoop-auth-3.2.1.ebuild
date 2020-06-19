# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-auth-3.2.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/hadoop/hadoop-auth/3.2.1/hadoop-auth-3.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-auth-3.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Hadoop Auth - Java HTTP SPNEGO"
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-auth:3.2.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava:27.0-jre -> >=dev-java/guava-29.0:0
# com.nimbusds:nimbus-jose-jwt:4.41.1 -> >=app-maven/nimbus-jose-jwt-8.19:0
# commons-codec:commons-codec:1.11 -> >=dev-java/commons-codec-1.11:0
# net.minidev:json-smart:2.3 -> >=app-maven/json-smart-2.3:1.3
# org.apache.curator:curator-framework:2.13.0 -> >=app-maven/curator-framework-5.0.0:0
# org.apache.httpcomponents:httpclient:4.5.6 -> !!!suitble-avenVersion-not-found!!!
# org.apache.kerby:kerb-simplekdc:1.0.1 -> >=app-maven/kerb-simplekdc-2.0.1:0
# org.apache.zookeeper:zookeeper:3.4.13 -> >=app-maven/zookeeper-3.6.1:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-2.0.0_alpha1:0

CDEPEND="
	!!!suitble-avenVersion-not-found!!!
	>=app-maven/curator-framework-5.0.0:0
	>=app-maven/json-smart-2.3:1.3
	>=app-maven/kerb-simplekdc-2.0.1:0
	>=app-maven/nimbus-jose-jwt-8.19:0
	>=app-maven/zookeeper-3.6.1:0
	>=dev-java/commons-codec-1.11:0
	>=dev-java/guava-29.0:0
	>=dev-java/slf4j-api-2.0.0_alpha1:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.servlet:javax.servlet-api:3.1.0 -> >=java-virtuals/servlet-api-3.1:3.1
# org.apache.hadoop:hadoop-annotations:3.2.1 -> >=app-maven/hadoop-annotations-3.2.1:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/hadoop-annotations-3.2.1:0
	>=java-virtuals/servlet-api-3.1:3.1
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.slf4j:slf4j-log4j12:1.7.25 -> !!!suitble-avenVersion-not-found!!!
RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}
	!!!suitble-avenVersion-not-found!!!

	>=dev-java/log4j-1.2.17:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guava,nimbus-jose-jwt,commons-codec,json-smart-1.3,curator-framework,!!!suitble-avenVersion-not-found!!!,kerb-simplekdc,zookeeper,slf4j-api,log4j,!!!suitble-avenVersion-not-found!!!"
JAVA_CLASSPATH_EXTRA="servlet-api-3.1,hadoop-annotations"
