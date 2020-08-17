# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/weld-api-1.1.Final.pom --download-uri https://repo1.maven.org/maven2/org/jboss/weld/weld-api/1.1.Final/weld-api-1.1.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild weld-api-1.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jboss.weld:weld-api:1.1.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Weld specifc extensions to the CDI API"
HOMEPAGE="http://www.seamframework.org/Weld"
SRC_URI="https://repo1.maven.org/maven2/org/jboss/weld/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/weld/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# javax.enterprise:cdi-api:1.0-SP3 -> >=dev-java/cdi-api-1.2:1.2
# javax.servlet:servlet-api:2.5 -> java-virtuals/servlet-api:4.0

CDEPEND="
	>=dev-java/cdi-api-1.2:1.2
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

JAVA_GENTOO_CLASSPATH="cdi-api-1.2,servlet-api-4.0"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
