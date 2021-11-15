# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="com.fasterxml.jackson.core:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="junit-4 pkgdiff"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Annotations for the Java Jackson data processor"
HOMEPAGE="https://github.com/FasterXML/jackson-annotations"
SRC_URI="
	https://github.com/FasterXML/${PN}/archive/${P}.tar.gz
	https://repo1.maven.org/maven2/com/fasterxml/jackson/core/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
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

S="${WORKDIR}/${PN}-${P}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_EXCLUDES=(
	# Non-tests
	com.fasterxml.jackson.annotation.TestBase
)

src_install() {
	java-pkg-simple_src_install
	dodoc README.md release-notes/VERSION-2.x
}
