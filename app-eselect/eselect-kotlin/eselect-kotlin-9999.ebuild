# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Leo3418/eselect-kotlin.git"
else
	SRC_URI="https://github.com/Leo3418/eselect-kotlin/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Eselect module for management of multiple Kotlin versions"
HOMEPAGE="https://wiki.gentoo.org/wiki/User:Leo3418/Kotlin"

LICENSE="GPL-2"
SLOT="0"

RDEPEND="
	app-admin/eselect
"

src_prepare() {
	default
	eautoreconf
}
