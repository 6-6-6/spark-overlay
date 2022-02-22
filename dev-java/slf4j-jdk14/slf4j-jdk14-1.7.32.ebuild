# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.slf4j:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="SLF4J binding for java.util.logging, which was added in JDK 1.4"
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

src_prepare() {
	if use test; then
		local test_root="${JAVA_TEST_SRC_DIR}/org/slf4j"
		cp "../slf4j-api/${test_root}/LoggerAccessingThread.java" \
			"${test_root}" || die "Failed to copy additional test sources"
		local helpers="${test_root}/helpers"
		mkdir -p "${helpers}" || die "Failed to create test helpers directory"
		cp \
			"../slf4j-api/${helpers}/BogoPerf.java" \
			"../slf4j-api/${helpers}/BubbleSort.java" \
			"../slf4j-api/${helpers}/MultithreadedInitializationTest.java" \
			"../slf4j-api/${helpers}/MyRandom.java" \
			"${helpers}" || die "Failed to copy test helpers"
		JAVA_TEST_EXCLUDES+=(
			org.slf4j.helpers.MultithreadedInitializationTest
		)
	fi
	java-pkg-2_src_prepare
}
