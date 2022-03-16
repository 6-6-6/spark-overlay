# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.locationtech.jts:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A Java library for creating and manipulating vector geometry"
HOMEPAGE="https://locationtech.github.io/jts/"
SRC_URI="https://github.com/locationtech/jts/archive/refs/tags/jts-${PV}.tar.gz"

# EDL-1.0, although is claimed to be "a BSD Style License" in LICENSES.md, is
# not exactly BSD as there are some discrepancies between terminologies (e.g.
# "HOLDERS" vs. "HOLDER", "OWNER" vs. "HOLDER").  Fortunately, LICENSES.md also
# states that the content in the project is licensed under either EPL-2.0 or
# EDL-1.0, permitting an EPL-2.0 singleton to be used for the LICENSE variable.
LICENSE="EPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

DOCS=(
	CONTRIBUTING.md
	LICENSES.md # Contains more information about licensing of this package
	MIGRATION.md
	README.md
	doc/JTS_Version_History.md
)

S="${WORKDIR}/jts-jts-${PV}"

JAVA_SRC_DIR="modules/${PN#jts-}/src/main/java"

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="modules/${PN#jts-}/src/test/java"
JAVA_TEST_RESOURCE_DIRS=( "modules/${PN#jts-}/src/test/resources" )

src_test() {
	pushd "${JAVA_TEST_SRC_DIR}" > /dev/null ||
		die "Failed to enter test sources directory"
	JAVA_TEST_RUN_ONLY=(
		# https://github.com/locationtech/jts/blob/jts-1.18.2/pom.xml#L277-L289
		# Also excluding abstract classes and classes with no runnable methods
		$(find * -wholename "**/*Test.java" \
			-not -wholename "**/*PerfTest.java" \
			-not -wholename "**/*StressTest.java" \
			-not -wholename "**/jts/perf/**/*.java" \
			-not -wholename "**/Abstract*Test.java" \
			-not -wholename "**/BaseDistanceTest.java" \
			-not -wholename "**/BinTreeCorrectTest.java" \
			-not -wholename "**/QuadtreeCorrectTest.java" \
		)
	)
	JAVA_TEST_RUN_ONLY=( "${JAVA_TEST_RUN_ONLY[@]/%.java}" )
	JAVA_TEST_RUN_ONLY=( "${JAVA_TEST_RUN_ONLY[@]//\//.}" )
	popd > /dev/null || die "Failed to leave test sources directory"
	java-pkg-simple_src_test
}

src_install() {
	java-pkg-simple_src_install
	einstalldocs # https://bugs.gentoo.org/789582
}
