# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="com.fasterxml.jackson.core:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="General data-binding functionality for Jackson: works on core streaming API"
HOMEPAGE="https://github.com/FasterXML/jackson-databind"
SRC_URI="
	https://github.com/FasterXML/${PN}/archive/refs/tags/${P}.tar.gz
	https://repo1.maven.org/maven2/com/fasterxml/jackson/core/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	~dev-java/jackson-${PV}:2
	~dev-java/jackson-annotations-${PV}:2
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/${PN}-${P}"

JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=( "src/main/resources" )
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TEST_SRC_DIR="skip-junit-tests-due-to-unpackaged-test-deps"

src_prepare() {
	java-pkg-2_src_prepare

	sed -e 's:@package@:com.fasterxml.jackson.databind.cfg:g' \
		-e "s:@projectversion@:${PV}:g" \
		-e 's:@projectgroupid@:com.fasterxml.jackson.core:g' \
		-e "s:@projectartifactid@:${PN}:g" \
		"${JAVA_SRC_DIR}/com/fasterxml/jackson/databind/cfg/PackageVersion.java.in" \
		> "${JAVA_SRC_DIR}/com/fasterxml/jackson/databind/cfg/PackageVersion.java" || die
}

src_install() {
	java-pkg-simple_src_install
	dodoc README.md release-notes/{CREDITS,VERSION}-2.x
}
