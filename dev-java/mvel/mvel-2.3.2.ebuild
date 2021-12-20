# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.mvel:mvel2:2.3.2.Final"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="MVFLEX Expression Language"
HOMEPAGE="https://github.com/mvel/mvel"
SRC_URI="https://github.com/mvel/mvel/archive/refs/tags/mvel2-${PV}.Final.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}/${PN}-${PN}2-${PV}.Final"

JAVA_SRC_DIR="src/main/java"

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS=( "src/test/resources" )
JAVA_TEST_EXCLUDES=(
	# No runnable methods
	org.mvel2.tests.perftests.CompiledPerformanceTests
	org.mvel2.tests.perftests.SimpleTests
	org.mvel2.tests.core.MVELThreadTest
	org.mvel2.tests.core.res.TestClass
	org.mvel2.tests.core.res.TestInterface
	org.mvel2.tests.core.res.TestMVEL197
	org.mvel2.tests.templates.tests.res.TestPluginNode
)
# Significantly speed up test execution
# https://github.com/mvel/mvel/blob/mvel2-2.3.2.Final/pom.xml#L158-L171
JAVA_TEST_EXTRA_ARGS=(
	-Dfile.encoding=UTF-8
	-Dmvel.disable.jit=true
	-Dmvel.tests.quick=true
)

src_prepare() {
	java-pkg-2_src_prepare
	eapply "${FILESDIR}/${P}-fix-for-java-10+.patch"
	use test && eapply "${FILESDIR}/${P}-ignore-failing.tests.patch"
}
