# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..10} )

inherit cmake python-single-r1

IUSE="+bzip2 +lz4 +parquet +python +zlib +zstd"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

DESCRIPTION="A cross-language development platform for in-memory data"
HOMEPAGE="https://arrow.apache.org/"
SRC_URI="https://www.apache.org/dyn/closer.lua?action=download&filename=arrow/arrow-${PV}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-java/brotli-dec
	bzip2? ( app-arch/bzip2 )
	lz4? ( app-arch/lz4:= )
	parquet? (
		dev-libs/libutf8proc:=
		dev-libs/re2:=
		dev-libs/thrift
	)
	python? (
		${PYTHON_DEPS}
		$(python_gen_cond_dep '
			dev-python/numpy[${PYTHON_USEDEP}]
		')
	)
	zlib? ( sys-libs/zlib )
	zstd? ( app-arch/zstd:= )
"

DEPEND="
	${RDEPEND}
	dev-cpp/xsimd
	dev-libs/rapidjson
	net-libs/grpc
"

S="${WORKDIR}/${P}/cpp"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	cmake_src_prepare
	sed -e '/SetupCxxFlags/d' -i CMakeLists.txt || die
	sed -e '/xsimd.*BUNDLED/d' \
		-i cmake_modules/ThirdpartyToolchain.cmake || die
}

src_configure() {
	local mycmakeargs=(
		-DARROW_BUILD_STATIC=OFF
		-DARROW_BUILD_SHARED=ON
		-DARROW_DEPENDENCY_SOURCE=SYSTEM
		-DARROW_JEMALLOC=OFF
		-DARROW_USE_CCACHE=OFF # Use ccache via Portage
		-DARROW_WITH_BZ2=$(usex bzip2)
		-DARROW_WITH_LZ4=$(usex lz4)
		-DARROW_PARQUET=$(usex parquet)
		-DARROW_PYTHON=$(usex python)
		-DARROW_WITH_ZLIB=$(usex zlib)
		-DARROW_WITH_ZSTD=$(usex zstd)
	)
	cmake_src_configure
}
