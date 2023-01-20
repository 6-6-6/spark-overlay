# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="net.java.dev.msv:msv-rngconverter:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="MSV RNG Converter"
HOMEPAGE="https://xmlark.github.io/msv/rngconverter/"
SRC_URI="https://github.com/xmlark/msv/archive/msv-${PV}.tar.gz"

LICENSE="BSD-1"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/msv-${PV}:0
	>=dev-java/xerces-2.12.0:2
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/msv-msv-${PV}/${PN#msv-}"

JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS="src/main/resources"

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS="src/test/resources"

src_test() {
	# https://github.com/xmlark/msv/blob/msv-2022.7/rngconverter/pom.xml#L202-L209
	pushd "${JAVA_TEST_SRC_DIR}" || die "Failed to enter JAVA_TEST_SRC_DIR"
	JAVA_TEST_RUN_ONLY=$(find * \
		\( -wholename "**/*Test.java" \
		-o -wholename "**/*TestCase.java" \
		-o -wholename "**/*TestCases.java" \) \
		! -wholename "**/*\$*" \
	)
	popd || die "Failed to leave JAVA_TEST_SRC_DIR"
	JAVA_TEST_RUN_ONLY="${JAVA_TEST_RUN_ONLY//.java}"
	JAVA_TEST_RUN_ONLY="${JAVA_TEST_RUN_ONLY//\//.}"

	# Some of this package's test classes rely on msv core's test classes
	cp -r ../msv/src/test/java/* "${JAVA_TEST_SRC_DIR}" ||
		die "Failed to copy msv core's test classes to JAVA_TEST_SRC_DIR"

	java-pkg-simple_src_test
}
