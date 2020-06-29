# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-auth-2.7.4.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/hadoop/hadoop-auth/2.7.4/hadoop-auth-2.7.4-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-auth-2.7.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Hadoop Auth - Java HTTP SPNEGO"
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-auth:2.7.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# commons-codec:commons-codec:1.4 -> >=dev-java/commons-codec-1.7:0
# org.apache.curator:curator-framework:2.7.1 -> >=app-maven/curator-framework-2.7.1:0
# org.apache.directory.server:apacheds-kerberos-codec:2.0.0-M15 -> >=app-maven/apacheds-kerberos-codec-2.0.0:0
# org.apache.httpcomponents:httpclient:4.2.5 -> >=dev-java/httpcomponents-client-4.5:4.5
# org.apache.zookeeper:zookeeper:3.4.6 -> >=app-maven/zookeeper-3.4.6:0
# org.slf4j:slf4j-api:1.7.10 -> >=dev-java/slf4j-api-2.0.0_alpha1:0

CDEPEND="
	>=app-maven/apacheds-kerberos-codec-2.0.0:0
	>=app-maven/curator-framework-2.7.1:0
	>=app-maven/zookeeper-3.4.6:0
	>=dev-java/commons-codec-1.7:0
	>=dev-java/httpcomponents-client-4.5:4.5
	>=dev-java/slf4j-api-2.0.0_alpha1:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.servlet:servlet-api:2.5 -> >=java-virtuals/servlet-api-2.5:2.5
# org.apache.hadoop:hadoop-annotations:2.7.4 -> >=app-maven/hadoop-annotations-2.7.4:0

DEPEND="
	>=virtual/jdk-1.7:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/hadoop-annotations-2.7.4:0
	>=java-virtuals/servlet-api-2.5:2.5
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.slf4j:slf4j-log4j12:1.7.10 -> >=dev-java/slf4j-log4j12-1.7.10:0
RDEPEND="
	>=virtual/jre-1.7:*
${CDEPEND}
	>=dev-java/log4j-1.2.17:0

	>=dev-java/slf4j-log4j12-1.7.10:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="commons-codec,curator-framework,apacheds-kerberos-codec,httpcomponents-client-4.5,zookeeper,slf4j-api,log4j,slf4j-log4j12"
JAVA_CLASSPATH_EXTRA="servlet-api-2.5,hadoop-annotations"
