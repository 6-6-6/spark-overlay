# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_SINGLE_IMPL=1

MY_PN="apache-arrow"
MY_P="${MY_PN}-${PV}"

inherit distutils-r1 multiprocessing

DESCRIPTION="Python library for Apache Arrow"
HOMEPAGE="https://arrow.apache.org/"
SRC_URI="https://www.apache.org/dyn/closer.lua?action=download&filename=arrow/arrow-${PV}/${MY_P}.tar.gz"

IUSE="+parquet"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Tests require dev-libs/apache-arrow to be built with jemalloc support,
# which is hard because apache-arrow builds and uses a bundled and vendored
# version of jemalloc, and the build process downloads files from the Internet
RESTRICT="test"

BDEPEND="
	dev-util/cmake
	test? (
		$(python_gen_cond_dep '
			dev-python/hypothesis[${PYTHON_USEDEP}]
			dev-python/pandas[${PYTHON_USEDEP}]
			dev-python/pytest-lazy-fixture[${PYTHON_USEDEP}]
		')
	)
"

RDEPEND="
	~dev-libs/apache-arrow-${PV}[parquet?,python,${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/numpy-1.16.6[${PYTHON_USEDEP}]
	')
"

DEPEND="
	${RDEPEND}
"

distutils_enable_tests pytest

S="${WORKDIR}/${MY_P}/python"

src_prepare() {
	distutils-r1_src_prepare

	# arrow is in the standard location, making ARROW_LIB_DIR useless.
	sed -e "/ARROW_LIB_DIR/d" \
		-i cmake_modules/FindArrow.cmake || die
}

src_compile() {
	export PYARROW_WITH_PARQUET=$(usex parquet)
	export PYARROW_PARALLEL=$(makeopts_jobs)
	export PYARROW_BUILD_VERBOSE=1
	distutils-r1_src_compile
}

src_test() {
	# Ensure none of the test files is in a descendent directory
	# containing the package source files; otherwise, there would be a
	# "No module named 'pyarrow.lib'" error while the tests are being run
	cp -r pyarrow/tests "${T}" ||
		die "Failed to copy tests to temporary directory"
	cd "${T}/tests" || die "Failed to change to temporary test directory"
	distutils-r1_src_test
}
