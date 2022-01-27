# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="C API for creating and generating Java Class files"
HOMEPAGE="http://icl.cs.utk.edu/f2j/"
SRC_URI="https://github.com/Leo3418/f2j/archive/refs/tags/f2j-${PV}.tar.gz"

# src/LICENSE: "The license covering the f2j source code is basically GPL with
# the addition of the BSD advertising clause."
LICENSE="BSD-4 GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

# All tests would echo "Failed"
RESTRICT="test"

BDEPEND="
	doc? (
		app-doc/doxygen
	)
"

S="${WORKDIR}/f2j-f2j-${PV}/${PN}"

src_prepare() {
	cp "${FILESDIR}/${P}-Makefile.am" "Makefile.am" ||
		die "Failed to copy Makefile.am"
	eapply -p2 "${FILESDIR}/${P}-libtool.patch"
	eapply_user
	eautoreconf
}

src_compile() {
	default
	if use doc; then
		PACKAGE_NAME="${PN}" PACKAGE_VERSION="${PV}" doxygen ||
			die "Failed to generate documentation"
	fi
}

src_install() {
	emake DESTDIR="${D}" install
	find "${ED}" -name "*.la" -delete || die "Failed to remove libtool files"
	doheader *.h
	if use doc; then
		dodoc -r html
		doman man/man3/*.3
	fi
}
