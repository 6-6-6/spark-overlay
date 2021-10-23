# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A Java library that allows for easy parsing and inspection of XML schema docs"
HOMEPAGE="https://xsom.dev.java.net/"
SRC_URI="https://repo1.maven.org/maven2/com/sun/${PN}/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="CDDL"
IUSE=""

CP_DEPEND="
	dev-java/relaxng-datatype:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"
