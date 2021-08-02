# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="com.github.wendykierp:JTransforms:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="junit-4 pkgdiff"

inherit java-pkg-2 java-pkg-simple

MY_PN="JTransforms"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Multithreaded FFT library written in pure Java"
HOMEPAGE="https://github.com/wendykierp/JTransforms"
SRC_URI="
	https://github.com/wendykierp/${MY_PN}/archive/refs/tags/${MY_P}.tar.gz -> ${P}.tar.gz
	https://repo1.maven.org/maven2/com/github/wendykierp/${MY_PN}/${PV}/${MY_P}.jar -> ${P}-bin.jar
"
LICENSE="BSD-2"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/commons-math:3
	dev-java/jlargearrays:0
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

S="${WORKDIR}/${MY_PN}-${MY_P}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TEST_RESOURCE_DIRS="src/test/resources"
JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"
