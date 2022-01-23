# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Helper routines for compiling or running any f2j-generated Java code"
HOMEPAGE="http://icl.cs.utk.edu/f2j/"
SRC_URI="https://github.com/Leo3418/f2j/archive/refs/tags/f2j-${PV}.tar.gz"

# src/LICENSE: "The license covering the f2j source code is basically GPL with
# the addition of the BSD advertising clause."
LICENSE="BSD-4 GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}/f2j-f2j-${PV}/util"

JAVA_SRC_DIR="org"
