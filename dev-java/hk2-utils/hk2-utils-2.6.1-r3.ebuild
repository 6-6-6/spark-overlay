# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.glassfish.hk2:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

MY_PN="glassfish-hk2"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="HK2 Implementation Utilities"
HOMEPAGE="https://eclipse-ee4j.github.io/glassfish-hk2/"
SRC_URI="https://github.com/eclipse-ee4j/glassfish-hk2/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.tar.gz"
LICENSE="|| ( EPL-2.0 GPL-2-with-classpath-exception )"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/classmate:0
	dev-java/jakarta-annotation-api:0
	dev-java/jakarta-inject:0
	dev-java/jboss-logging:0
	dev-java/hibernate-validator:0
	dev-java/validation-api:2.0
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	test? (
		dev-java/commons-lang:3.6
		dev-java/javax-el:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/${MY_P}/${PN}"

JAVA_SRC_DIR="src/main/java"

JAVA_TEST_GENTOO_CLASSPATH="
	junit-4
	commons-lang-3.6
	javax-el
"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_EXCLUDES=(
	# No runnable methods
	org.glassfish.hk2.utilities.reflection.annotations.TestContract
)
