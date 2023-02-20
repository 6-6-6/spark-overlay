# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source"
MAVEN_ID="com.github.stephenc.jcip:${PN}:1.0-1"

inherit java-pkg-2 java-pkg-simple

MY_P="${PN}-$(ver_rs 2 -)"

DESCRIPTION="Clean room implementation of the JCIP Annotations"
HOMEPAGE="https://github.com/stephenc/jcip-annotations"
SRC_URI="https://github.com/stephenc/${PN}/archive/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}/${PN}-${MY_P}"
JAVA_SRC_DIR="src/main/java"
