# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="pl.edu.icm:JLargeArrays:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="junit-4 pkgdiff"

inherit java-pkg-2 java-pkg-simple

MY_PN="JLargeArrays"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Library of one-dimensional arrays that can store up to 2^63 elements."
HOMEPAGE="https://gitlab.com/visnow.org/JLargeArrays"
SRC_URI="
	https://gitlab.com/visnow.org/${MY_PN}/-/archive/${MY_P}/${MY_PN}-${MY_P}.tar.gz -> ${P}.tar.gz
	https://repo1.maven.org/maven2/pl/edu/icm/${MY_PN}/${PV}/${MY_P}.jar -> ${P}-bin.jar
"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/commons-math:3
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

# Need package com.sun.xml.internal.ws.encoding.soap
JAVAC_ARGS="-XDignore.symbol.file=true"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"
