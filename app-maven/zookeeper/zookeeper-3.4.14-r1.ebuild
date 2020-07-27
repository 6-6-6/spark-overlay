# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/zookeeper-3.4.14.pom --download-uri https://repo1.maven.org/maven2/org/apache/zookeeper/zookeeper/3.4.14/zookeeper-3.4.14-sources.jar --slot 0 --keywords "~amd64" --ebuild zookeeper-3.4.14-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://repo1.maven.org/maven2/org/apache/${PN}/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.zookeeper:zookeeper:3.4.14"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.spotbugs:spotbugs-annotations:3.1.9 -> >=app-maven/spotbugs-annotations-3.1.9:0
# commons-collections:commons-collections:3.2.2 -> >=dev-java/commons-collections-3.2.2:3
# commons-lang:commons-lang:2.4 -> >=dev-java/commons-lang-2.6:2.1
# io.netty:netty:3.10.6.Final -> >=app-maven/netty-3.10.6:0
# jdiff:jdiff:1.0.9 -> >=app-maven/jdiff-1.0.9:0
# jline:jline:0.9.94 -> >=dev-java/jline-2.12.1:2
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.apache.maven:maven-ant-tasks:2.1.3 -> >=app-maven/maven-ant-tasks-2.1.3:0
# org.apache.maven.wagon:wagon-http:2.4 -> >=app-maven/wagon-http-2.4:0
# org.apache.rat:apache-rat-tasks:0.6 -> >=app-maven/apache-rat-tasks-0.6:0
# org.apache.yetus:audience-annotations:0.5.0 -> >=app-maven/audience-annotations-0.5.0:0
# org.openclover:clover:4.2.1 -> >=app-maven/clover-4.2.1:0
# org.owasp:dependency-check-ant:4.0.2 -> >=app-maven/dependency-check-ant-4.0.2:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-1.7.28:0
# org.slf4j:slf4j-log4j12:1.7.25 -> >=dev-java/slf4j-log4j12-1.7.28:0
# org.vafer:jdeb:0.8 -> >=app-maven/jdeb-1.1:0
# xerces:xerces:1.4.4 -> >=dev-java/xerces-2.12.0:2

CDEPEND="
	>=app-maven/apache-rat-tasks-0.6:0
	>=app-maven/audience-annotations-0.5.0:0
	>=app-maven/clover-4.2.1:0
	>=app-maven/dependency-check-ant-4.0.2:0
	>=app-maven/jdeb-1.1:0
	>=app-maven/jdiff-1.0.9:0
	>=app-maven/maven-ant-tasks-2.1.3:0
	>=app-maven/netty-3.10.6:0
	>=app-maven/spotbugs-annotations-3.1.9:0
	>=app-maven/wagon-http-2.4:0
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

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
