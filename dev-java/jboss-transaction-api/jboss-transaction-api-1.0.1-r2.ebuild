# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jboss.spec.javax.transaction:jboss-transaction-api_1.2_spec:1.0.1.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The Java Transaction 1.2 API classes"
HOMEPAGE="https://github.com/jboss/jboss-transaction-api_spec"
SRC_URI="
	https://repo1.maven.org/maven2/org/jboss/spec/javax/transaction/${PN}_1.2_spec/${PV}.Final/${PN}_1.2_spec-${PV}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/spec/javax/transaction/${PN}_1.2_spec/${PV}.Final/${PN}_1.2_spec-${PV}.Final.jar -> ${P}-bin.jar
"
LICENSE="|| ( CDDL GPL-2-with-classpath-exception )"
SLOT="1.2_spec"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		>=dev-java/jboss-interceptors-api-1.0.1:1.2_spec
		>=dev-java/cdi-api-1.2:1.2
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="cdi-api-1.2,jboss-interceptors-api-1.2_spec"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVADOC_ARGS="-source 8"
