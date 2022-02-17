# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MAVEN_ID="org.kohsuke:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="junit-4 pkgdiff"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java binding for libpam.so"
HOMEPAGE="https://libpam4j.kohsuke.org/"
SRC_URI="
	https://github.com/kohsuke/${PN}/archive/refs/tags/${P}.tar.gz
	https://repo1.maven.org/maven2/org/kohsuke/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/jna:4
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

S="${WORKDIR}/${PN}-${P}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"

pkg_setup() {
	java-pkg-2_pkg_setup
	JAVA_TEST_EXTRA_ARGS=(
		"-Djna.boot.library.path=$(java-config -i jna-4)"
	)
}
