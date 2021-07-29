# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.fusesource.jansi:jansi:1.13"

# Upstream JAR bundles jansi, jansi-native and hawtjni-runtime together, which
# is a very poor decision.  This ebuild only compiles jansi, so the JAR it
# produces will never match the upstream pre-built.  Therefore, pkgdiff tests
# were disabled.
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A java library for generating and interpreting ANSI escape sequences"
HOMEPAGE="https://fusesource.github.io/jansi/"
SRC_URI="
	https://github.com/fusesource/${PN}/archive/refs/tags/jansi-project-${PV}.tar.gz
	https://repo1.maven.org/maven2/org/fusesource/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="1.13"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/jansi-native-1.8:0
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

S="${WORKDIR}/jansi-jansi-project-${PV}"

JAVA_SRC_DIR="jansi/src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="jansi/src/test/java"
JAVA_TEST_RESOURCE_DIRS="jansi/src/test/resources"
