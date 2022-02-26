# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.apache.mina:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

MY_P="apache-mina-${PV}"

DESCRIPTION="Apache MINA Project"
HOMEPAGE="https://mina.apache.org/"
SRC_URI="mirror://apache/mina/mina/${PV}/${MY_P}-src.tar.gz"

KEYWORDS="~amd64"
LICENSE="Apache-2.0"
SLOT="0"

CP_DEPEND="
	dev-java/log4j-12-api:2
	dev-java/slf4j-api:0
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

S="${WORKDIR}/${MY_P}"

JAVA_SRC_DIR="src/${PN}/src/main/java"

JAVA_TEST_GENTOO_CLASSPATH="junit-4,easymock-3.2"
JAVA_TEST_SRC_DIR="src/${PN}/src/test/java"
JAVA_TEST_RESOURCE_DIRS=( "src/${PN}/src/test/resources" )
JAVA_TEST_EXCLUDES=(
	# No runnable methods
	testcase.MinaRegressionTest
)

src_prepare() {
	use test && eapply "${FILESDIR}/${P}-ignore-failing-tests.patch"
	java-pkg-2_src_prepare
}
