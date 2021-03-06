# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-yarn-server-web-proxy-2.5.1.pom --download-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-yarn-server-web-proxy/2.5.1/hadoop-yarn-server-web-proxy-2.5.1-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-yarn-server-web-proxy-2.5.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.hadoop:hadoop-yarn-server-web-proxy:2.5.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Apache Hadoop Project POM"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava:11.0.2 -> >=dev-java/guava-29.0:0
# commons-httpclient:commons-httpclient:3.1 -> >=dev-java/commons-httpclient-3.1:3
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# javax.servlet:servlet-api:2.5 -> java-virtuals/servlet-api:4.0
# org.apache.hadoop:hadoop-yarn-api:2.5.1 -> >=dev-java/hadoop-yarn-api-2.5.1:0
# org.apache.hadoop:hadoop-yarn-common:2.5.1 -> >=dev-java/hadoop-yarn-common-2.5.1:0
# org.apache.hadoop:hadoop-yarn-server-common:2.5.1 -> >=dev-java/hadoop-yarn-server-common-2.5.1:0
# org.mortbay.jetty:jetty:6.1.26 -> >=dev-java/jetty-6.1.26:6

CDEPEND="
	>=dev-java/hadoop-yarn-api-2.5.1:0
	>=dev-java/hadoop-yarn-common-2.5.1:0
	>=dev-java/hadoop-yarn-server-common-2.5.1:0
	>=dev-java/jetty-6.1.26:6
	>=dev-java/commons-httpclient-3.1:3
	>=dev-java/commons-logging-1.2:0
	>=dev-java/guava-29.0:0
	java-virtuals/servlet-api:4.0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-common:2.5.1 -> >=dev-java/hadoop-common-2.5.1:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/hadoop-common-2.5.1:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guava,commons-httpclient-3,commons-logging,servlet-api-4.0,hadoop-yarn-api,hadoop-yarn-common,hadoop-yarn-server-common,jetty-6"
JAVA_CLASSPATH_EXTRA="hadoop-common"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
