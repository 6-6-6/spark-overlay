# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-logging-3.3.2.Final.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/logging/jboss-logging/3.3.2.Final/jboss-logging-3.3.2.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild jboss-logging-3.3.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The JBoss Logging Framework"
HOMEPAGE="http://www.jboss.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/logging/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.logging:jboss-logging:3.4.0.Final"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# log4j:log4j:1.2.16 -> >=dev-java/log4j-1.2.17:0
# org.apache.logging.log4j:log4j-api:2.0 -> !!!groupId-not-found!!!
# org.jboss.logmanager:jboss-logmanager:1.5.2.Final -> >=dev-java/jboss-logmanager-1.5.2:0
# org.slf4j:slf4j-api:1.7.2 -> >=dev-java/slf4j-api-1.7.7:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=app-maven/log4j-api-2.3:0
	>=dev-java/jboss-logmanager-1.5.2:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/slf4j-api-1.7.7:0
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="log4j,log4j-api,jboss-logmanager,slf4j-api"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
}
