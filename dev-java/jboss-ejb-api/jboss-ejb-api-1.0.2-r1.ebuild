# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jboss.spec.javax.ejb:${PN}_3.1_spec:${PV}.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN="${PN}_3.1_spec"
MY_PV="${PV}.Final"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="The Java EJB 3.1 API classes"
HOMEPAGE="https://github.com/jboss/jboss-ejb-api_spec"
SRC_URI="
	https://repo1.maven.org/maven2/org/jboss/spec/javax/ejb/${MY_PN}/${MY_PV}/${MY_P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/spec/javax/ejb/${MY_PN}/${MY_PV}/${MY_P}.jar -> ${P}-bin.jar
"
LICENSE="|| ( CDDL GPL-2-with-classpath-exception )"
SLOT="3.1_spec"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/jboss-transaction-api-1.0.0:1.1_spec
	>=dev-java/glassfish-xmlrpc-api-1.1.1-r1:0
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
