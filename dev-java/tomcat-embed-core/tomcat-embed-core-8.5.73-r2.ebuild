# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.tomcat.embed:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Core Tomcat implementation"
HOMEPAGE="https://tomcat.apache.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/tomcat/embed/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/tomcat/embed/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# pkgdiff JAR content comparison complains about XML, DTD and property files
RESTRICT="test"

CP_DEPEND="
	~dev-java/tomcat-annotations-api-${PV}:0
	dev-java/javax-mail:0
	dev-java/jakarta-ejb-api:3
	dev-java/jakarta-xml-ws-api:2
	dev-java/javax-persistence:0
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
