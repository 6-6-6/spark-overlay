# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="com.fasterxml.jackson.dataformat:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Data format extension for Jackson for serializing and deserializing POJOs as XML"
HOMEPAGE="https://github.com/FasterXML/jackson-dataformat-xml"
SRC_URI="
	https://github.com/FasterXML/${PN}/archive/refs/tags/${P}.tar.gz
	https://repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	~dev-java/jackson-${PV}:2
	~dev-java/jackson-annotations-${PV}:2
	~dev-java/jackson-databind-${PV}:0
	>=dev-java/woodstox-core-5.0.2:0
	>=dev-java/stax2-api-4.2.1:0
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

	sed -e 's:@package@:com.fasterxml.jackson.dataformat.xml:g' \
		-e "s:@projectversion@:${PV}:g" \
		-e 's:@projectgroupid@:com.fasterxml.jackson.dataformat:g' \
		-e "s:@projectartifactid@:${PN}:g" \
		"${JAVA_SRC_DIR}/com/fasterxml/jackson/dataformat/xml/PackageVersion.java.in" \
		> "${JAVA_SRC_DIR}/com/fasterxml/jackson/dataformat/xml/PackageVersion.java" || die
	}

src_install() {
	java-pkg-simple_src_install
	dodoc README.md release-notes/{CREDITS,VERSION}-2.x
}
