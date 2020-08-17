# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/quartz-2.3.2.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/quartz-scheduler/quartz/2.3.2/quartz-2.3.2-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/quartz-scheduler/quartz/2.3.2/quartz-2.3.2.jar --slot 0 --keywords "~amd64" --ebuild quartz-2.3.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.quartz-scheduler:quartz:2.3.2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Enterprise Job Scheduler"
HOMEPAGE="http://www.quartz-scheduler.org/quartz"
SRC_URI="https://repo1.maven.org/maven2/org/${PN}-scheduler/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/${PN}-scheduler/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.mchange:c3p0:0.9.5.4 -> >=dev-java/c3p0-0.9.5.4:0
# com.mchange:mchange-commons-java:0.2.15 -> >=dev-java/mchange-commons-0.2.15:0
# com.zaxxer:HikariCP-java7:2.4.13 -> >=dev-java/HikariCP-java7-2.4.13:0
# org.slf4j:slf4j-api:1.7.7 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	dev-java/terracotta-toolkit-api:0
	dev-java/terracotta-toolkit-api-internal:0
	>=dev-java/HikariCP-java7-2.4.13:0
	>=dev-java/c3p0-0.9.5.4:0
	>=dev-java/mchange-commons-0.2.15:0
	>=dev-java/slf4j-api-1.7.7:0
	java-virtuals/transaction-api:0
	java-virtuals/servlet-api:4.0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="terracotta-toolkit-api,terracotta-toolkit-api-internal,c3p0,mchange-commons,HikariCP-java7,slf4j-api,transaction-api,servlet-api-4.0"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
