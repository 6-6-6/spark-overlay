# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.codehaus.groovy:groovy-all:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4 pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Groovy: A powerful, dynamic language for the JVM"
HOMEPAGE="https://groovy-lang.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/codehaus/groovy/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/codehaus/groovy/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Lots of compiler errors related to type checking
IUSE="+binary"

CP_DEPEND="
	>=dev-java/xstream-1.4.7:0
	>=dev-java/ant-core-1.10.7:0
	>=dev-java/ant-ivy-2.4.0:2
	>=dev-java/bsf-2.4.0:2.3
	>=dev-java/commons-logging-1.2:0
	>=dev-java/jansi-1.11-r2:0
	>=dev-java/jcommander-1.48:0
	>=dev-java/jline-2.12.1:2
	>=dev-java/junit-4.12:4
	>=dev-java/qdox-1.12.1:1.12
	dev-java/commons-cli:1
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
		dev-java/javax-jsp-api:2.2
		dev-java/jakarta-servlet-api:4
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
	>=dev-java/ant-launcher-1.9.4:0
	>=dev-java/gpars-1.2.1:0
	>=dev-java/ant-antlr-1.10.7:0
	>=dev-java/ant-junit-1.10.7:0
	>=dev-java/testng-6.9.10:0
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="javax-jsp-api-2.2,jakarta-servlet-api-4"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
