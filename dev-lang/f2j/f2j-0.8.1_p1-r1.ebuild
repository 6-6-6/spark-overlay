# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Fortran-to-Java translator, especially for BLAS, LAPACK and ARPACK"
HOMEPAGE="http://icl.cs.utk.edu/f2j/"
SRC_URI="https://github.com/Leo3418/f2j/archive/refs/tags/${P}.tar.gz"

# src/LICENSE: "The license covering the f2j source code is basically GPL with
# the addition of the BSD advertising clause."
LICENSE="BSD-4 GPL-2"
SLOT="0"
KEYWORDS="~amd64"

# 'make test' gives "make: Nothing to be done for 'test'." because the Makefile
# does not have a 'test' target, yet there is a directory called 'test'
RESTRICT="test"

BDEPEND="
	sys-devel/bison
"

DEPEND="
	dev-libs/libbytecode
"

RDEPEND="
	${DEPEND}
"

S="${WORKDIR}/${PN}-${P}"

PATCHES=(
	"${FILESDIR}/${P}-gentoo.patch"
)

src_prepare() {
	default
	eautoconf
}

src_compile() {
	cd src || die "Failed to change to source directory"
	emake
}

src_install() {
	dobin src/f2java
}
