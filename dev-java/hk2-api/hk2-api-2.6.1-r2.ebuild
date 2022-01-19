# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.glassfish.hk2:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

MY_PN="glassfish-hk2"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="HK2 API module"
HOMEPAGE="https://eclipse-ee4j.github.io/glassfish-hk2/"
SRC_URI="https://github.com/eclipse-ee4j/glassfish-hk2/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.tar.gz"
LICENSE="|| ( EPL-2.0 GPL-2-with-classpath-exception )"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	~dev-java/hk2-utils-${PV}:0
	dev-java/aopalliance-repackaged:0
	dev-java/jakarta-inject:0
	dev-java/osgi-resource-locator:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	test? (
		dev-java/easymock:3.2
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
	easymock-3.2
"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS=( "src/test/resources" )
