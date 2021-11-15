# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="com.fasterxml.jackson.core:jackson-core:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="junit-4 pkgdiff"

inherit java-pkg-2 java-pkg-simple

MY_PN="jackson-core"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="High-performance JSON processor"
HOMEPAGE="https://github.com/FasterXML/jackson-core"
SRC_URI="
	https://github.com/FasterXML/${MY_PN}/archive/${MY_P}.tar.gz
	https://repo1.maven.org/maven2/com/fasterxml/jackson/core/${MY_PN}/${PV}/${MY_P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="2"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8
"

RDEPEND="
	>=virtual/jre-1.8
"

S="${WORKDIR}/${MY_PN}-${MY_P}"

JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=( "src/main/resources" )
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS=( "src/test/resources" )

src_prepare() {
	java-pkg-2_src_prepare

	sed -e 's:@package@:com.fasterxml.jackson.core.json:g' \
		-e "s:@projectversion@:${PV}:g" \
		-e 's:@projectgroupid@:com.fasterxml.jackson.core:g' \
		-e "s:@projectartifactid@:${MY_PN}:g" \
		"${JAVA_SRC_DIR}/com/fasterxml/jackson/core/json/PackageVersion.java.in" \
		> "${JAVA_SRC_DIR}/com/fasterxml/jackson/core/json/PackageVersion.java" || die
}

src_install() {
	java-pkg-simple_src_install
	dodoc README.md release-notes/{CREDITS,VERSION}-2.x
}

src_test() {
	pushd "${JAVA_TEST_SRC_DIR}" > /dev/null ||
		die "Failed to enter test sources directory"
	JAVA_TEST_EXCLUDES=(
		# Upstream keeps failing tests in a dedicated Java package
		$(find com/fasterxml/jackson/failing -name "*.java" |
			sed -e "s/.java\$//" | sed -e "s/\//./g")

		# Non-tests
		perf.ConcurrencyReadTest
		perf.ManualCharAccessTest
	)
	popd > /dev/null || die "Failed to exit test sources directory"
	java-pkg-simple_src_test
}
