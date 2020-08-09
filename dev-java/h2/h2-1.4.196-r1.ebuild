# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/h2-1.4.196.pom --download-uri https://repo1.maven.org/maven2/com/h2database/h2/1.4.196/h2-1.4.196-sources.jar --slot 0 --keywords "~amd64" --ebuild h2-1.4.196-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.h2database:h2:1.4.196"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="H2 Database Engine"
HOMEPAGE="http://www.h2database.com"
SRC_URI="https://repo1.maven.org/maven2/com/${PN}database/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/${PN}database/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="|| ( MPL-1.1 EPL-1.0 )"
SLOT="0"
KEYWORDS="~amd64"

CDEPEND="
	dev-java/lucene:3.6
	dev-java/slf4j-api:0
	dev-java/jts-core:0
	dev-java/osgi-framework:1
	dev-java/osgi-service-jdbc:0
	java-virtuals/servlet-api:4.0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="lucene-3.6,jts-core,slf4j-api,osgi-framework-1,osgi-service-jdbc,servlet-api-4.0"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
