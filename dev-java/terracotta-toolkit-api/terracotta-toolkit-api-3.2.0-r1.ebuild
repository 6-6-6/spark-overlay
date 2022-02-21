# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.terracotta.toolkit:terracotta-toolkit-1.3-api:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN="terracotta-toolkit-1.3-api"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Terracotta Toolkit API"
HOMEPAGE="https://www.terracotta.org/"
SRC_URI="
	https://repo.terracotta.org/maven2/org/terracotta/toolkit/${MY_PN}/${PV}/${MY_P}-sources.jar -> ${P}-sources.jar
	https://repo.terracotta.org/maven2/org/terracotta/toolkit/${MY_PN}/${PV}/${MY_P}.jar -> ${P}-bin.jar
"
LICENSE="TPL-1.0"
SLOT="0"
KEYWORDS="~amd64"

# japi-compliance-checker would fail due to
# return value type change of some methods
RESTRICT="test"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_install() {
	java-pkg-simple_src_install
	docinto / && dodoc "${JAVA_SRC_DIR}/thirdpartylicenses.txt"
}
