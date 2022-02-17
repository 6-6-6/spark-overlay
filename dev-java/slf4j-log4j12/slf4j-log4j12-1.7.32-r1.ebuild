# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.slf4j:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4 pkgdiff"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="SLF4J LOG4J-12 Binding"
HOMEPAGE="https://www.slf4j.org"
SRC_URI="
	https://github.com/qos-ch/slf4j/archive/refs/tags/v_${PV}.tar.gz -> slf4j-${PV}-sources.tar.gz
	https://repo1.maven.org/maven2/org/slf4j/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"

CP_DEPEND="
	dev-java/log4j-12-api:2
	>=dev-java/slf4j-api-${PV}:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/slf4j-v_${PV}"

JAVA_SRC_DIR="${PN}/src/main/java"
JAVA_RESOURCE_DIRS=( "${PN}/src/main/resources" )
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR=(
	"${PN}/src/test/java"
	"slf4j-api/src/test/java" # For class MultithreadedInitializationTest
)
JAVA_TEST_RESOURCE_DIRS=( "${PN}/src/test/resources" )
JAVA_TEST_EXCLUDES=(
	org.slf4j.NoBindingTest
	org.slf4j.helpers.MultithreadedInitializationTest
	org.slf4j.impl.Log4j12MultithreadedInitializationTest
)

src_prepare() {
	java-pkg_clean
	eapply "${FILESDIR}/${P}-migrate-to-log4j-12-api.patch"
	java-pkg-2_src_prepare
	# The tests in this file adds and uses an Appender to verify whether
	# messages have been successfully logged, which no longer works with
	# the log4j-12-api bridge because the methods for adding an Appender
	# in the bridge "are largely no-ops"
	# https://logging.apache.org/log4j/log4j-2.2/log4j-1.2-api/index.html
	rm slf4j-log4j12/src/test/java/org/slf4j/InvocationTest.java ||
		die "Failed to remove tests that are incompatible with log4j-12-api"
}
