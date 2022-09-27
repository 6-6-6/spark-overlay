# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Apache Spark Python API"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/apache/spark/tree/master/python"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-java/spark-core-3.0.0
	>=dev-python/pyarrow-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.7[${PYTHON_USEDEP}]
	>=dev-python/pandas-0.23.2[${PYTHON_USEDEP}]
	>=dev-python/py4j-0.10.9[${PYTHON_USEDEP}]
"
