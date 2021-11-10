# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_P="apache-mina-${PV}"

DESCRIPTION="Apache MINA Project"
HOMEPAGE="https://mina.apache.org/"
SRC_URI="mirror://apache/mina/mina/${PV}/${MY_P}-src.tar.bz2 -> ${P}.tar.bz2"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"
SLOT="0"

CP_DEPEND="
	dev-java/slf4j-api:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/${MY_P}"

JAVA_SRC_DIR="src/${PN}/src/main/java"
