# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.sun.jersey.contribs:jersey-guice:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Guice module for starting Jetty based rest server with Jersey"
HOMEPAGE="https://jersey.java.net/jersey-contribs/jersey-guice/"
SRC_URI="
	https://repo1.maven.org/maven2/com/sun/jersey/contribs/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/sun/jersey/contribs/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="CDDL-1.1 GPL-2-with-classpath-exception"
SLOT="1"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/jersey-server-1.9:1
	>=dev-java/guice-4.1:4
	>=dev-java/guice-servlet-4.1:4
	>=dev-java/javax-inject-1:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
		dev-java/jakarta-servlet-api:4
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jakarta-servlet-api-4"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
