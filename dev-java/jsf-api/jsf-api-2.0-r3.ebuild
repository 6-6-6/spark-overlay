# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="javax.faces:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Sun's implementation of the JSF 2.0 specification"
HOMEPAGE="https://javaee.github.io/javaserverfaces/index-0.html"
SRC_URI="
	https://repo1.maven.org/maven2/javax/faces/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/javax/faces/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="CDDL GPL-1"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		dev-java/jakarta-servlet-api:4
		dev-java/javax-jsp-api:2.2
		>=dev-java/jstl-1.2:0
		dev-java/validation-api:2.0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="
	jakarta-servlet-api-4
	javax-jsp-api-2.2
	jstl
	validation-api-2.0
"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
