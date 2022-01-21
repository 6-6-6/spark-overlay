# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit prefix

DESCRIPTION="Utility for bulk rebuilding dev-java/*::spark-overlay packages"
HOMEPAGE="https://github.com/6-6-6/spark-overlay"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"

src_prepare() {
	cp "${FILESDIR}/${P}.sh" "${PN}" ||
		die "Failed to copy main program script from FILESDIR to S"
	default
	eprefixify "${PN}"
	sed -i -e "s/@VERSION@/${PV}/g" "${PN}" ||
		die "Failed to write version number into main program script"
}

src_install() {
	dobin "${PN}"
}
