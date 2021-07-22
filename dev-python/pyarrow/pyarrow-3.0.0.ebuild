# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1

DESCRIPTION="Python library for Apache Arrow"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://arrow.apache.org/"

IUSE="+parquet"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-python/numpy-1.16.6[${PYTHON_USEDEP}]
=dev-libs/apache-arrow-${PV}*[parquet?]"
distutils_enable_tests pytest

src_compile() {
	export PYARROW_WITH_PARQUET=$(usex parquet "ON" "")
	local jobs=$(makeopts_jobs "${MAKEOPTS}" INF)
	export PYARROW_PARALLEL="${jobs}"
	export PYARROW_BUILD_VERBOSE="1"
	distutils-r1_src_compile
}
