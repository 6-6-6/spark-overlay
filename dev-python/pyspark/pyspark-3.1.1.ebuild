# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

inherit distutils-r1

DESCRIPTION="Apache Spark Python API"
SRC_URI="mirror://pypi/45/b0/9d6860891ab14a39d4bddf80ba26ce51c2f9dc4805e5c6978ac0472c120a/pyspark-3.1.1.tar.gz"
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
