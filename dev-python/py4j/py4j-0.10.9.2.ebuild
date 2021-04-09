# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1

DESCRIPTION="Apache Spark Python API"
SRC_URI="mirror://pypi/19/77/2b0efd0da6189e24ff2cc07952d1d48e4406d8a8c704d4445d222ab3eec8/py4j-0.10.9.2.tar.gz"
HOMEPAGE="https://www.py4j.org"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest
