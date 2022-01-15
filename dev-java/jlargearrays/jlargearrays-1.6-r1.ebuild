# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="pl.edu.icm:JLargeArrays:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple readme.gentoo-r1

MY_PN="JLargeArrays"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Library of one-dimensional arrays that can store up to 2^63 elements"
HOMEPAGE="https://gitlab.com/visnow.org/JLargeArrays"
SRC_URI="https://gitlab.com/visnow.org/${MY_PN}/-/archive/${MY_P}/${MY_PN}-${MY_P}.tar.gz -> ${P}.tar.gz"

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
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/${MY_PN}-${MY_P}"

# Need package com.sun.xml.internal.ws.encoding.soap
JAVAC_ARGS="-XDignore.symbol.file=true"
JAVA_SRC_DIR="src/main/java"

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"

README_GENTOO_SUFFIX="-java-version-compatibility"

src_prepare() {
	ver_test "$(java-config -g PROVIDES_VERSION)" -ge 9 && \
		eapply "${FILESDIR}/${P}-necessary-changes-for-java-9.patch"
	java-pkg-2_src_prepare
}

src_install() {
	java-pkg-simple_src_install
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
