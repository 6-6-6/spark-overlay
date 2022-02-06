# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Leo3418/eselect-kotlin.git"
else
	SRC_URI="https://github.com/Leo3418/eselect-kotlin/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Eselect module for management of multiple Kotlin versions"
HOMEPAGE="https://wiki.gentoo.org/wiki/User:Leo3418/Kotlin"

LICENSE="GPL-2"
SLOT="0"

src_prepare() {
	default
	eautoreconf
}
