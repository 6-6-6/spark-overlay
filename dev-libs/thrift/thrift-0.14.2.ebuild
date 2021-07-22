# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Software framework for cross-language services development"
HOMEPAGE="https://thrift.apache.org/"
SRC_URI="https://archive.apache.org/dist/${PN}/${PV}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/boost:=
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	# econf Option Notes
	#
	# --with-boost
	# Is this necessary?  Chances are removing this option has no
	# effect at all
	#
	# --enable-tests
	# Ideally, this should be controlled by FEATURES="test"
	#
	# --without-<lang>
	# Support for more languages can be added later via USE flags;
	# Python support probably should never be added because there
	# is already a dev-python/thrift package in ::gentoo
	#
	# A list of all available options can be obtained with
	#	./configure --help
	# There are lots of configurable options for this package, so
	# expanding the array of this ebuild's USE flags to support
	# as many of them as possible is definitely on the to-do list
	econf \
		--with-boost="${ESYSROOT}/usr" \
		--enable-tests="no" \
		--without-go \
		--without-java \
		--without-nodejs \
		--without-rs \
		--without-ruby \
		--without-python \
		--without-py3
}
