# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.quartz-scheduler:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Enterprise Job Scheduler"
HOMEPAGE="https://www.quartz-scheduler.org/quartz"
SRC_URI="
	https://repo1.maven.org/maven2/org/${PN}-scheduler/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/${PN}-scheduler/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Multiple dependencies are missing, and java-ebuilder would fail to create an
# ebuild for some transitive dependencies
IUSE="+binary"

CP_DEPEND="
	dev-java/terracotta-toolkit-api:0
	dev-java/terracotta-toolkit-api-internal:0
	>=dev-java/HikariCP-java7-2.4.13:0
	>=dev-java/c3p0-0.9.5.4:0
	dev-java/jta:0
	dev-java/mchange-commons:0
	>=dev-java/slf4j-api-1.7.7:0
	java-virtuals/servlet-api:4.0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
