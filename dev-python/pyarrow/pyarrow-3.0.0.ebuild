# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1

DESCRIPTION="Python library for Apache Arrow"
SRC_URI="mirror://pypi/62/d3/a482d8a4039bf931ed6388308f0cc0541d0cab46f0bbff7c897a74f1c576/pyarrow-3.0.0.tar.gz"
HOMEPAGE="https://arrow.apache.org/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND=">=dev-python/numpy-1.16.6[${PYTHON_USEDEP}]
=dev-libs/apache-arrow-${PV}*"
distutils_enable_tests pytest
