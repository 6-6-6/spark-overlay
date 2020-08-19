# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="com.fasterxml:classmate:1.5.1"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Zero-dependency Java library for accurately introspecting type information"
HOMEPAGE="https://github.com/cowtowncoder/java-classmate/"
SRC_URI="https://github.com/cowtowncoder/java-classmate/archive/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=virtual/jre-1.8"

DEPEND="
	>=virtual/jdk-1.8
"

S="${WORKDIR}/java-${PN}-${P}"

JAVA_SRC_DIR="src/main/java"

JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_GENTOO_CLASSPATH="junit-4"

src_prepare() {
	default
	rm -v pom.xml \
		src/test/java/com/fasterxml/classmate/AnnotationsTest.java || die
}
