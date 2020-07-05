# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-auth-2.5.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/hadoop/hadoop-auth/2.5.1/hadoop-auth-2.5.1-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-auth-2.5.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Hadoop Auth - Java HTTP SPNEGO"
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-auth:2.5.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# commons-codec:commons-codec:1.4 -> >=dev-java/commons-codec-1.7:0
# org.apache.directory.server:apacheds-kerberos-codec:2.0.0-M15 -> >=app-maven/apacheds-kerberos-codec-2.0.0:0
# org.apache.httpcomponents:httpclient:4.2.5 -> >=dev-java/httpcomponents-client-4.5:4.5
# org.slf4j:slf4j-api:1.7.5 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=app-maven/apacheds-kerberos-codec-2.0.0:0
	>=dev-java/commons-codec-1.7:0
	>=dev-java/httpcomponents-client-4.5:4.5
	>=dev-java/slf4j-api-1.7.7:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.servlet:servlet-api:2.5 -> >=java-virtuals/servlet-api-4.0:4.0
# org.apache.hadoop:hadoop-annotations:2.5.1 -> >=app-maven/hadoop-annotations-2.5.1:0

DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/hadoop-annotations-2.5.1:0
	>=java-virtuals/servlet-api-4.0:4.0
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.slf4j:slf4j-log4j12:1.7.5 -> >=dev-java/slf4j-log4j12-1.7.7:0
RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}
	>=dev-java/log4j-1.2.17:0

	>=dev-java/slf4j-log4j12-1.7.7:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="commons-codec,apacheds-kerberos-codec,httpcomponents-client-4.5,slf4j-api,log4j,slf4j-log4j12"
JAVA_CLASSPATH_EXTRA="servlet-api-4.0,hadoop-annotations"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
