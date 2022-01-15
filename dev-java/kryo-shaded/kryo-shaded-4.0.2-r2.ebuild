# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="com.esotericsoftware:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit junit-4"

inherit java-pkg-2 java-pkg-simple

MY_PN="kryo-parent"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Java binary serialization and cloning: fast, efficient, automatic"
HOMEPAGE="https://github.com/EsotericSoftware/kryo"
SRC_URI="https://github.com/EsotericSoftware/kryo/archive/refs/tags/${MY_P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/minlog-1.3.1:0
	>=dev-java/objenesis-2.5.1:0
	dev-java/reflectasm:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	test? (
		dev-java/commons-lang:2.1
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/kryo-${MY_P}"

JAVA_SRC_DIR="src"

JAVA_TEST_GENTOO_CLASSPATH="junit-4,commons-lang-2.1"
JAVA_TEST_SRC_DIR="test"
JAVA_TEST_RESOURCE_DIRS="test/resources"
JAVA_TEST_EXCLUDES=(
	# No runnable methods
	com.esotericsoftware.kryo.TestKryoMain1
	com.esotericsoftware.kryo.TestKryoMainNate
	# No tests
	com.esotericsoftware.kryo.KryoTestCase
)

JAVADOC_ARGS="-source 8"

src_prepare() {
	MY_JAVA_VERSION="$(java-config -g PROVIDES_VERSION)"
	if ver_test "${MY_JAVA_VERSION}" -ge 9; then
		eapply "${FILESDIR}/${P}-java-9+-Cleaner.patch"
		use test && \
			eapply "${FILESDIR}/${P}-java-9+-disable-failing-tests.patch"
	fi
	java-pkg-2_src_prepare
}

pkg_postinst() {
	if ver_test "${MY_JAVA_VERSION}" -ge 9; then
		elog "For information about illegal reflective access warnings when"
		elog "this package is used with Java 9 or above, please refer to"
		elog "https://github.com/EsotericSoftware/kryo/issues/543"
	fi
}
