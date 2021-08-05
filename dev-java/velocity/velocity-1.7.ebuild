# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.velocity:velocity:1.7"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="General purpose template engine"
HOMEPAGE="https://velocity.apache.org/engine/devel/"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="1.7"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/unzip
"

CDEPEND="
	>=dev-java/commons-collections-3.2.2:0
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/jakarta-oro-2.0.8:2.0
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CDEPEND}
		>=dev-java/ant-core-1.10.9:0
		dev-java/avalon-logkit:2.0
		>=dev-java/commons-logging-1.2:0
		>=dev-java/jdom-1.1.3:0
		>=dev-java/log4j-1.2.17:0
		>=dev-java/werken-xpath-0.9.4:0
		java-virtuals/servlet-api:4.0
		java-virtuals/jms
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="commons-collections,commons-lang-2.1,jakarta-oro-2.0"
JAVA_CLASSPATH_EXTRA="ant-core,avalon-logkit-2.0,commons-logging,servlet-api-4.0,jdom,log4j,werken-xpath"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
