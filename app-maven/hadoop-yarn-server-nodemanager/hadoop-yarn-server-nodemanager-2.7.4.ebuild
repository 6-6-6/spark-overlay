# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-yarn-server-nodemanager-2.7.4.pom --download-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-yarn-server-nodemanager/2.7.4/hadoop-yarn-server-nodemanager-2.7.4-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-yarn-server-nodemanager-2.7.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Hadoop Project POM"
HOMEPAGE=""
SRC_URI="https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-yarn-server-nodemanager:2.7.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava:11.0.2 -> >=dev-java/guava-29.0:0
# com.google.inject:guice:3.0 -> >=dev-java/guice-4.1:4
# com.google.inject.extensions:guice-servlet:3.0 -> >=dev-java/guice-4.1:4
# com.google.protobuf:protobuf-java:2.5.0 -> >=dev-java/protobuf-java-3.11.4:0
# com.sun.jersey:jersey-client:1.9 -> >=app-maven/jersey-client-1.9:0
# com.sun.jersey:jersey-core:1.9 -> >=app-maven/jersey-core-1.9:0
# com.sun.jersey:jersey-json:1.9 -> >=app-maven/jersey-json-1.9:0
# com.sun.jersey.contribs:jersey-guice:1.9 -> >=app-maven/jersey-guice-1.9:0
# commons-codec:commons-codec:1.4 -> >=dev-java/commons-codec-1.7:0
# commons-lang:commons-lang:2.6 -> >=dev-java/commons-lang-2.6:2.1
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# javax.servlet:servlet-api:2.5 -> >=java-virtuals/servlet-api-4.0:4.0
# javax.xml.bind:jaxb-api:2.2.2 -> >=app-maven/jaxb-api-2.2.2:0
# org.apache.hadoop:hadoop-annotations:2.7.4 -> >=app-maven/hadoop-annotations-2.7.4:0
# org.apache.hadoop:hadoop-yarn-api:2.7.4 -> >=app-maven/hadoop-yarn-api-2.7.4:0
# org.apache.hadoop:hadoop-yarn-common:2.7.4 -> >=app-maven/hadoop-yarn-common-2.7.4:0
# org.apache.hadoop:hadoop-yarn-server-common:2.7.4 -> >=app-maven/hadoop-yarn-server-common-2.7.4:0
# org.codehaus.jettison:jettison:1.1 -> >=dev-java/jettison-1.3.7:0
# org.fusesource.leveldbjni:leveldbjni:1.8 -> >=dev-java/leveldbjni-1.8:0
# org.mortbay.jetty:jetty-util:6.1.26 -> >=app-maven/jetty-util-6.1.26:6
# org.slf4j:slf4j-api:1.7.10 -> >=dev-java/slf4j-api-1.7.28:0

CDEPEND="
	>=app-maven/hadoop-annotations-2.7.4:0
	>=app-maven/hadoop-yarn-api-2.7.4:0
	>=app-maven/hadoop-yarn-common-2.7.4:0
	>=app-maven/hadoop-yarn-server-common-2.7.4:0
	>=app-maven/jaxb-api-2.2.2:0
	>=app-maven/jersey-client-1.9:0
	>=app-maven/jersey-core-1.9:0
	>=app-maven/jersey-guice-1.9:0
	>=app-maven/jersey-json-1.9:0
	>=app-maven/jetty-util-6.1.26:6
	>=dev-java/commons-codec-1.7:0
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/commons-logging-1.2:0
	>=dev-java/guava-29.0:0
	>=dev-java/guice-4.1:4
	>=dev-java/jettison-1.3.7:0
	>=dev-java/leveldbjni-1.8:0
	>=dev-java/protobuf-java-3.11.4:0
	>=dev-java/slf4j-api-1.7.28:0
	java-virtuals/servlet-api:4.0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-common:2.7.4 -> >=app-maven/hadoop-common-2.7.4:0

DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=app-maven/hadoop-common-2.7.4:0
	)
"

RDEPEND="
	>=virtual/jre-1.7:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guava,guice-4,guice-4,protobuf-java,jersey-client,jersey-core,jersey-json,jersey-guice,commons-codec,commons-lang-2.1,commons-logging,servlet-api-4.0,jaxb-api,hadoop-annotations,hadoop-yarn-api,hadoop-yarn-common,hadoop-yarn-server-common,jettison,leveldbjni,jetty-util-6,slf4j-api"
JAVA_CLASSPATH_EXTRA="hadoop-common"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
