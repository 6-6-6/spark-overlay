# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
JAVA_PKG_IUSE="doc source test"
JAVA_TESTING_FRAMEWORKS="junit"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="High performance Java reflection"
HOMEPAGE="https://github.com/EsotericSoftware/reflectasm/"
SRC_URI="https://github.com/EsotericSoftware/${PN}/archive/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"
IUSE=""

CP_DEPEND="
	dev-java/asm:4
"

DEPEND="
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/${PN}-${P}"

JAVA_SRC_DIR="src"
JAVA_TEST_SRC_DIR="test"
JAVA_TEST_GENTOO_CLASSPATH="junit"

src_prepare() {
	default
	java-pkg_clean
}
