# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.slf4j:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="java.util.logging to SLF4J bridge"
HOMEPAGE="https://www.slf4j.org"
SRC_URI="https://github.com/qos-ch/slf4j/archive/v_${PV}.tar.gz -> slf4j-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/slf4j-api-${PV}:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	test? (
		>=dev-java/slf4j-log4j12-${PV}:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/slf4j-v_${PV}/${PN}"

JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=( "src/main/resources" )

JAVA_TEST_GENTOO_CLASSPATH="junit-4,slf4j-log4j12"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS=( "src/test/resources" )

src_prepare() {
	use test && eapply -p2 "${FILESDIR}/${P}-test-fixes-for-log4j-12-api.patch"
	java-pkg-2_src_prepare
}
