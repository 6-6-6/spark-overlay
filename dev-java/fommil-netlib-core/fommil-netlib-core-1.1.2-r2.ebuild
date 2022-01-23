# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.github.fommil.netlib:core:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN="core"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Mission-critical components for linear algebra systems"
HOMEPAGE="https://github.com/fommil/netlib-java"
SRC_URI="
	https://repo1.maven.org/maven2/com/github/fommil/netlib/${MY_PN}/${PV}/${MY_P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/github/fommil/netlib/${MY_PN}/${PV}/${MY_P}.jar -> ${P}-bin.jar
"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/jarpack:0
	dev-java/jlapack:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
		dev-java/lombok-bin:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="lombok-bin"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
