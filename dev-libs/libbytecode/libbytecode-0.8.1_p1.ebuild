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
	default
	eautoconf
}

src_compile() {
	default
	use doc && PACKAGE_NAME="${PN}" PACKAGE_VERSION="${PV}" emake docs
}

src_install() {
	emake F2J_LIBDIR="${ED}/usr/$(get_libdir)" install
	doheader *.h
	if use doc; then
		dodoc -r html
		doman man/man3/*.3
	fi
}
