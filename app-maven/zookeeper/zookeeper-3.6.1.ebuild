# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/zookeeper-3.6.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/zookeeper/zookeeper/3.6.1/zookeeper-3.6.1-sources.jar --slot 0 --keywords "~amd64" --ebuild zookeeper-3.6.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="ZooKeeper server"
HOMEPAGE="http://zookeeper.apache.org/zookeeper"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.zookeeper:zookeeper:3.6.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# commons-lang:commons-lang:2.6 -> >=dev-java/commons-lang-2.6:2.1
# io.netty:netty-handler:4.1.48.Final -> >=dev-java/netty-buffer-4.0.21:0
# io.netty:netty-transport-native-epoll:4.1.48.Final -> >=app-maven/netty-transport-native-epoll-5.0.0:0
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.apache.yetus:audience-annotations:0.5.0 -> >=app-maven/audience-annotations-0.12.0:0
# org.apache.zookeeper:zookeeper-jute:3.6.1 -> >=app-maven/zookeeper-jute-3.6.1:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-1.7.7:0
# org.slf4j:slf4j-log4j12:1.7.25 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=app-maven/audience-annotations-0.12.0:0
	>=app-maven/netty-transport-native-epoll-5.0.0:0
	>=app-maven/zookeeper-jute-3.6.1:0
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/log4j-1.2.17:0
	>=dev-java/netty-buffer-4.0.21:0
	>=dev-java/slf4j-api-1.7.7:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-databind:2.10.3 -> >=dev-java/jackson-databind-2.11.0:0
# com.github.spotbugs:spotbugs-annotations:4.0.2 -> >=app-maven/spotbugs-annotations-4.0.3:0
# com.googlecode.json-simple:json-simple:1.1.1 -> >=dev-java/json-simple-1.1:0
# commons-cli:commons-cli:1.2 -> >=dev-java/commons-cli-1.4:1
# io.dropwizard.metrics:metrics-core:3.2.5 -> >=app-maven/metrics-core-4.1.9:0
# jline:jline:2.11 -> >=dev-java/jline-2.12.1:2
# org.eclipse.jetty:jetty-server:9.4.24.v20191120 -> >=app-maven/jetty-server-9.3.24_p20180605:0
# org.eclipse.jetty:jetty-servlet:9.4.24.v20191120 -> >=app-maven/jetty-servlet-9.3.24_p20180605:0
# org.xerial.snappy:snappy-java:1.1.7 -> >=dev-java/snappy-1.0.3_rc3:1.0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/jetty-server-9.3.24_p20180605:0
	>=app-maven/jetty-servlet-9.3.24_p20180605:0
	>=app-maven/metrics-core-4.1.9:0
	>=app-maven/spotbugs-annotations-4.0.3:0
	>=dev-java/commons-cli-1.4:1
	>=dev-java/jackson-databind-2.11.0:0
	>=dev-java/jline-2.12.1:2
	>=dev-java/json-simple-1.1:0
	>=dev-java/snappy-1.0.3_rc3:1.0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="commons-lang-2.1,netty-buffer,netty-transport-native-epoll,log4j,audience-annotations,zookeeper-jute,slf4j-api,slf4j-api"
JAVA_GENTOO_CLASSPATH_EXTRA="jackson-databind,spotbugs-annotations,json-simple,commons-cli-1,metrics-core,jline-2,jetty-server,jetty-servlet,snappy-1.0"
