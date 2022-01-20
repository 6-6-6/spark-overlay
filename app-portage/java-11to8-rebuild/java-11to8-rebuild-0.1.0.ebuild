# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit prefix

DESCRIPTION="Utility for bulk rebuilding Java packages when switching from Java 11 back to 8"
HOMEPAGE="https://github.com/Leo3418/spark-overlay/discussions/1"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"

src_prepare() {
	cp "${FILESDIR}/${P}.sh" "${PN}.sh" ||
		die "Failed to copy main program script from FILESDIR to S"
	default
	eprefixify "${PN}.sh"
	sed -i -e "s/@VERSION@/${PV}/g" "${PN}.sh" ||
		die "Failed to write version number into main program script"
}

src_install() {
	local dest_suffix="libexec/${PN}/${PN}.sh"
	exeinto "/usr/$(dirname "${dest_suffix}")"
	doexe "${PN}.sh"
	dodir /usr/bin
	dosym "../${dest_suffix}" /usr/bin/h2o-11to8-rebuild
	dosym "../${dest_suffix}" /usr/bin/jetty9-11to8-rebuild
}
