# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.apache.commons:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Expression language engine, can be embedded in applications and frameworks"
HOMEPAGE="https://commons.apache.org/jexl/"
SRC_URI="mirror://apache/commons/jexl/source/${P}-src.tar.gz"

LICENSE="Apache-2.0"
SLOT="2"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/commons-logging:0
"

BDEPEND="
	>=dev-java/javacc-5.0
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/${P}-src"

DOCS=( NOTICE.txt RELEASE-NOTES.txt )

JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=( "src/main/resources" )

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_EXCLUDES=(
	# No tests found
	org.apache.commons.jexl2.JexlTestCase
	# Fails on Java 11
	org.apache.commons.jexl2.ClassCreatorTest
)

src_prepare() {
	java-pkg-2_src_prepare

	if use test; then
		sed -i -e '/asserter.assertExpression("[0-9]\+ *\/ *0"/d' \
			"${JAVA_TEST_SRC_DIR}/org/apache/commons/jexl2/ArithmeticTest.java" ||
			die "Failed to remove dubious assertion"
		sed -i -e '/asserter.assertExpression(".*imanull/d' \
			"${JAVA_TEST_SRC_DIR}/org/apache/commons/jexl2/ArithmeticTest.java" ||
			die "Failed to remove dubious assertion"
	fi

	# These two calls are what the "jjtree-javacc" goal in the pom.xml does
	jjtree -OUTPUT_DIRECTORY="${JAVA_SRC_DIR}/org/apache/commons/jexl2/parser" \
		"${JAVA_SRC_DIR}/org/apache/commons/jexl2/parser/Parser.jjt" \
		|| die "Code generation via jjtree failed"
	javacc -OUTPUT_DIRECTORY="${JAVA_SRC_DIR}/org/apache/commons/jexl2/parser" \
		"${JAVA_SRC_DIR}/org/apache/commons/jexl2/parser/Parser.jj" \
		|| die "Parser.java code generation via javacc failed"
}

src_install() {
	java-pkg-simple_src_install
	einstalldocs # https://bugs.gentoo.org/789582
}
