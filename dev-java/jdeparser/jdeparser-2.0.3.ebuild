# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.jboss.jdeparser:${PN}:${PV}.Final"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

MY_PN="${PN}2"
MY_PV="${PV}.Final"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="JDeparser, a Java source code generating library"
HOMEPAGE="https://github.com/jdeparser/jdeparser2"
SRC_URI="https://github.com/jdeparser/jdeparser2/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Depends on sun.reflect.Reflection, which is no longer available on Java 11
DEPEND="
	virtual/jdk:1.8
"

RDEPEND="
	virtual/jre:1.8
"

S="${WORKDIR}/${MY_P}"

JAVA_SRC_DIR="src/main/java"

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"

DOCS=( README.md )

src_install() {
	java-pkg-simple_src_install
	einstalldocs # https://bugs.gentoo.org/789582
}
