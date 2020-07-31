# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Extensions to complement JSR-173 StAX API"
HOMEPAGE="http://stax-ex.java.net/"
SRC_URI="https://repo1.maven.org/maven2/org/jvnet/${PN/-/}/${PN}/${PV}/${P}-sources.jar
		https://repo1.maven.org/maven2/org/jvnet/${PN/-/}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"

LICENSE="CDDL GPL-2"
SLOT="1"
KEYWORDS="amd64 ~ppc64 x86"

IUSE=""

JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_RM_FILES=(
	"module-info.java"
	)

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEPEND}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	${COMMON_DEPEND}"
