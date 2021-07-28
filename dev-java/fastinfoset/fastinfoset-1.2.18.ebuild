# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.sun.xml.fastinfoset:FastInfoset:1.2.18"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN="FastInfoset"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Open Source implementation of the Fast Infoset Standard for Binary XML"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jaxb-impl/FastInfoset"
SRC_URI="
	https://repo1.maven.org/maven2/com/sun/xml/fastinfoset/${MY_PN}/${PV}/${MY_P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/sun/xml/fastinfoset/${MY_PN}/${PV}/${MY_P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0 EPL-1.0"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_prepare() {
	default

	rm "${JAVA_SRC_DIR}/module-info.java" || \
		die "Failed to remove module-info.java"
}
