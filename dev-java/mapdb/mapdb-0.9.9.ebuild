# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="org.mapdb:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="junit-4 pkgdiff"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Concurrent Maps, Sets and Queues backed by disk storage or off-heap-memory"
HOMEPAGE="https://mapdb.org/"
SRC_URI="
	https://github.com/jankotek/${PN}/archive/refs/tags/${P}.tar.gz
	https://repo1.maven.org/maven2/org/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0.9.9"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}/${PN}-${P}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TEST_EXCLUDES=(
	# Abstract classes only to be inherited by other concrete test classes
	org.mapdb.ClosedThrowsExceptionTest
	org.mapdb.ConcurrentMapInterfaceTest
	org.mapdb.EngineTest
	org.mapdb.JSR166TestCase
	org.mapdb.MapInterfaceTest
	org.mapdb.TestFile
)
JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"
