# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/zookeeper-3.4.14.pom --download-uri https://repo1.maven.org/maven2/org/apache/zookeeper/zookeeper/3.4.14/zookeeper-3.4.14-sources.jar --slot 0 --keywords "~amd64" --ebuild zookeeper-3.4.14-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.zookeeper:zookeeper:3.4.14"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="${MAVEN_ID}"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="https://repo1.maven.org/maven2/org/apache/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.spotbugs:spotbugs-annotations:3.1.9 -> >=dev-java/spotbugs-annotations-3.1.9:0
# commons-collections:commons-collections:3.2.2 -> >=dev-java/commons-collections-3.2.2:3
# commons-lang:commons-lang:2.4 -> >=dev-java/commons-lang-2.6:2.1
# io.netty:netty:3.10.6.Final -> >=dev-java/netty-3.10.6:0
# jdiff:jdiff:1.0.9 -> >=dev-java/jdiff-1.0.9:0
# jline:jline:0.9.94 -> >=dev-java/jline-2.12.1:2
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.apache.maven:maven-ant-tasks:2.1.3 -> >=dev-java/maven-ant-tasks-2.1.3:0
# org.apache.maven.wagon:wagon-http:2.4 -> >=dev-java/wagon-http-2.4:0
# org.apache.rat:apache-rat-tasks:0.6 -> >=dev-java/apache-rat-tasks-0.6:0
# org.apache.yetus:audience-annotations:0.5.0 -> >=dev-java/audience-annotations-0.5.0:0
# org.openclover:clover:4.2.1 -> >=dev-java/clover-4.2.1:0
# org.owasp:dependency-check-ant:4.0.2 -> >=dev-java/dependency-check-ant-4.0.2:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-1.7.28:0
# org.slf4j:slf4j-log4j12:1.7.25 -> >=dev-java/slf4j-log4j12-1.7.28:0
# org.vafer:jdeb:0.8 -> >=dev-java/jdeb-1.1:0
# xerces:xerces:1.4.4 -> >=dev-java/xerces-2.12.0:2

CDEPEND="
	>=dev-java/apache-rat-tasks-0.6:0
	>=dev-java/audience-annotations-0.5.0:0
	>=dev-java/clover-4.2.1:0
	>=dev-java/dependency-check-ant-4.0.2:0
	>=dev-java/jdeb-1.1:0
	>=dev-java/jdiff-1.0.9:0
	>=dev-java/maven-ant-tasks-2.1.3:0
	>=dev-java/netty-3.10.6:0
	>=dev-java/spotbugs-annotations-3.1.9:0
	>=dev-java/wagon-http-2.4:0
	>=dev-java/commons-collections-3.2.2:3
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/jline-2.12.1:2
	>=dev-java/log4j-1.2.17:0
	>=dev-java/slf4j-api-1.7.28:0
	>=dev-java/slf4j-log4j12-1.7.28:0
	>=dev-java/xerces-2.12.0:2
	dev-java/jline:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="spotbugs-annotations,commons-collections-3,commons-lang-2.1,netty,jdiff,jline-2,log4j,maven-ant-tasks,wagon-http,apache-rat-tasks,audience-annotations,clover,dependency-check-ant,slf4j-api,slf4j-log4j12,jdeb,xerces-2,jline"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
