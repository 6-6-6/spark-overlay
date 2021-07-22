# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit cmake python-single-r1

IUSE="+bzip2 +lz4 +parquet +python +zlib +zstd"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DESCRIPTION="A cross-language development platform for in-memory data."
HOMEPAGE="https://arrow.apache.org/"
SRC_URI="https://www.apache.org/dyn/closer.lua?action=download&filename=arrow/arrow-${PV}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	python? (
		${PYTHON_DEPS}
		$(python_gen_cond_dep '
			dev-python/numpy[${PYTHON_USEDEP}]
		')
	)
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-cpp/xsimd
	dev-java/brotli-dec
	dev-libs/libutf8proc
	dev-libs/rapidjson
	dev-libs/re2
	dev-libs/thrift
	net-libs/grpc
"

S="${WORKDIR}/${P}/cpp"

src_prepare() {
	sed -e '/SetupCxxFlags/d' -i CMakeLists.txt || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DARROW_DEPENDENCY_SOURCE=SYSTEM
		-DARROW_JEMALLOC=OFF
		-DARROW_PARQUET=$(usex parquet ON OFF)
		-DARROW_WITH_BZ2=$(usex bzip2 ON OFF)
		-DARROW_WITH_LZ4=$(usex lz4 ON OFF)
		-DARROW_PYTHON=$(usex python ON OFF)
		-DARROW_WITH_ZLIB=$(usex zlib ON OFF)
		-DARROW_WITH_ZSTD=$(usex zstd ON OFF)
	)
	cmake_src_configure
}
