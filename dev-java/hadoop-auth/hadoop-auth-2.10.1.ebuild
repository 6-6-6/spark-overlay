# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-auth-2.10.1.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-auth/2.10.1/hadoop-auth-2.10.1-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-auth/2.10.1/hadoop-auth-2.10.1.jar --slot 0 --keywords "~amd64" --ebuild hadoop-auth-2.10.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.hadoop:hadoop-auth:2.10.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Apache Hadoop Auth - Java HTTP SPNEGO"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava:11.0.2 -> >=dev-java/guava-20.0:20
# com.nimbusds:nimbus-jose-jwt:7.9 -> >=dev-java/nimbus-jose-jwt-7.9:0
# commons-codec:commons-codec:1.4 -> >=dev-java/commons-codec-1.7:0
# org.apache.curator:curator-framework:2.13.0 -> >=dev-java/curator-framework-2.13.0:0
# org.apache.directory.server:apacheds-kerberos-codec:2.0.0-M15 -> >=dev-java/apacheds-kerberos-codec-2.0.0:0
# org.apache.httpcomponents:httpclient:4.5.2 -> >=dev-java/httpclient-4.5.6:0
# org.apache.zookeeper:zookeeper:3.4.14 -> >=dev-java/zookeeper-3.4.14:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-1.7.28:0

CDEPEND="
	>=dev-java/apacheds-kerberos-codec-2.0.0:0
	>=dev-java/commons-codec-1.7:0
	>=dev-java/curator-framework-2.13.0:0
	>=dev-java/guava-20.0:20
	>=dev-java/httpclient-4.5.6:0
	>=dev-java/nimbus-jose-jwt-7.9:0
	>=dev-java/slf4j-api-1.7.28:0
	>=dev-java/zookeeper-3.4.14:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.servlet:servlet-api:2.5 -> java-virtuals/servlet-api:4.0
# org.apache.hadoop:hadoop-annotations:2.10.1 -> >=dev-java/hadoop-annotations-2.10.1:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/hadoop-annotations-2.10.1:0
		java-virtuals/servlet-api:4.0
	)
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.slf4j:slf4j-log4j12:1.7.25 -> >=dev-java/slf4j-log4j12-1.7.28:0

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
	>=dev-java/log4j-1.2.17:0

	>=dev-java/slf4j-log4j12-1.7.28:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guava-20,nimbus-jose-jwt,commons-codec,curator-framework,apacheds-kerberos-codec,httpclient,zookeeper,slf4j-api,log4j,slf4j-log4j12"
JAVA_CLASSPATH_EXTRA="servlet-api-4.0,hadoop-annotations"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
