# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="net.sourceforge.f2j:arpack_combined_all:${PV}"

inherit java-pkg-2 java-pkg-simple

MY_PN="arpack_combined_all"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Java APIs for the BLAS, LAPACK, and ARPACK Fortran libraries"
HOMEPAGE="https://icl.cs.utk.edu/f2j/"
SRC_URI="https://repo1.maven.org/maven2/net/sourceforge/f2j/${MY_PN}/${PV}/${MY_P}.jar -> ${P}.jar"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

# Binary package, permitted to use JRE in DEPEND
DEPEND="
	>=virtual/jre-1.8:*
"

RDEPEND="
	${DEPEND}
"

src_unpack() {
	: # Binary package, no source to unpack or compile
}

src_compile() {
	cp "${DISTDIR}/${P}.jar" "${JAVA_JAR_FILENAME}" || \
		die "Failed to copy JAR to JAVA_JAR_FILENAME"
}

src_install() {
	java-pkg_jarinto "/opt/${PN}/lib"
	java-pkg-simple_src_install
}
