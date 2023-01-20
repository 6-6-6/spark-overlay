# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.slf4j:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="SLF4J Log4j 1.2 binding"
HOMEPAGE="https://www.slf4j.org"
SRC_URI="https://github.com/qos-ch/slf4j/archive/v_${PV}.tar.gz -> slf4j-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"

CP_DEPEND="
	dev-java/log4j-12-api:2
	>=dev-java/slf4j-api-${PV}:1
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/slf4j-v_${PV}/${PN}"

JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=( "src/main/resources" )

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS=( "src/test/resources" )
JAVA_TEST_EXCLUDES=(
	# Failing tests
	org.slf4j.impl.Log4j12MultithreadedInitializationTest
)

src_prepare() {
	if use test; then
		local test_root="${JAVA_TEST_SRC_DIR}/org/slf4j"
		cp "../slf4j-api/${test_root}/LoggerAccessingThread.java" \
			"${test_root}" || die "Failed to copy additional test sources"
		local helpers="${test_root}/helpers"
		mkdir -p "${helpers}" || die "Failed to create test helpers directory"
		cp "../slf4j-api/${helpers}/MultithreadedInitializationTest.java" \
			"${helpers}" || die "Failed to copy test helpers"
		JAVA_TEST_EXCLUDES+=(
			org.slf4j.helpers.MultithreadedInitializationTest
		)
	fi

	eapply -p2 "${FILESDIR}/${P}-migrate-to-log4j-12-api.patch"
	java-pkg-2_src_prepare
	# The tests in this file add and use an Appender to verify whether
	# messages have been successfully logged, which no longer works with
	# the log4j-12-api bridge because the methods for adding an Appender
	# in the bridge "are largely no-ops":
	# https://logging.apache.org/log4j/log4j-2.2/log4j-1.2-api/index.html
	rm "${JAVA_TEST_SRC_DIR}/org/slf4j/InvocationTest.java" ||
		die "Failed to remove tests that are incompatible with log4j-12-api"
}
