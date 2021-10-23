# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# The project switched to Git, but tags were never migrated.
GIT_REF="f67d35c1da06922c8165f66a919490ee94a04649"

MY_PN="jts"
JAVA_PKG_IUSE="doc source test"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JTS Topology Suite for Java"
HOMEPAGE="https://tsusiatsoftware.net/jts/main.html"
SRC_URI="https://github.com/dr-jts/jts/archive/${GIT_REF}.tar.gz -> ${MY_PN}-${PV}.tar.gz"
LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}/${MY_PN}-${GIT_REF}/${MY_PN}"
JAVA_SRC_DIR="java/src"

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="java/test"
JAVA_TEST_RUN_ONLY=( "test.jts.junit.MasterTester" )

src_prepare() {
	default

	java-pkg_clean

	# Use text-based test runner.
	sed -i "s/swingui/textui/g" java/test/test/jts/junit/SimpleTest.java || \
		die "Failed to modify source code to use text-based test runner"
}
