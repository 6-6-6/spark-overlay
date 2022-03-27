# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MAVEN_ID="com.fasterxml.jackson.module:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="junit-4 pkgdiff"

inherit java-pkg-2 java-pkg-simple

MY_PN="jackson-modules-base"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Jackson extension module for JAXB annotations support"
HOMEPAGE="https://github.com/FasterXML/jackson-modules-base/blob/HEAD/jaxb"
SRC_URI="
	https://github.com/FasterXML/${MY_PN}/archive/refs/tags/${MY_P}.tar.gz
	https://repo1.maven.org/maven2/com/fasterxml/jackson/module/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/jackson-core-${PV}:0
	>=dev-java/jackson-annotations-${PV}:2
	>=dev-java/jackson-databind-${PV}:0
	dev-java/jakarta-activation-api:1
	dev-java/jaxb-api:2
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
	test? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/${MY_PN}-${MY_P}/jaxb"

JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=( "src/main/resources" )
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"

src_prepare() {
	java-pkg-2_src_prepare

	sed -e 's:@package@:com.fasterxml.jackson.module.jaxb:g' \
		-e "s:@projectversion@:${PV}:g" \
		-e 's:@projectgroupid@:com.fasterxml.jackson.module:g' \
		-e "s:@projectartifactid@:${PN}:g" \
		"${JAVA_SRC_DIR}/com/fasterxml/jackson/module/jaxb/PackageVersion.java.in" \
		> "${JAVA_SRC_DIR}/com/fasterxml/jackson/module/jaxb/PackageVersion.java" || die
	}

src_test() {
	pushd "${JAVA_TEST_SRC_DIR}" > /dev/null ||
		die "Failed to enter test sources directory"
	JAVA_TEST_EXCLUDES=(
		# Upstream keeps failing tests in a dedicated Java package
		$(find com/fasterxml/jackson/module/jaxb/failing -name "*.java" |
			sed -e "s/.java\$//" | sed -e "s/\//./g")

		# Non-tests
		com.fasterxml.jackson.module.jaxb.BaseJaxbTest
	)
	popd > /dev/null || die "Failed to exit test sources directory"
	java-pkg-simple_src_test
}

src_install() {
	java-pkg-simple_src_install
	dodoc README.md release-notes/{CREDITS,VERSION}
}
