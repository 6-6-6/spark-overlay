# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

DESCRIPTION="Apache Spark Python API"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/apache/spark/tree/master/python"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=dev-python/numpy-1.7
	>=dev-python/pandas-0.23.2
	>=dev-python/pyarrow-1.0.0
	=dev-python/py4j-0.10.9*
	>=dev-java/spark-core-3.0.0"

distutils_enable_tests pytest
