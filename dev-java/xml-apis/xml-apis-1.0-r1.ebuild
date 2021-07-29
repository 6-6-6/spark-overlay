# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="xml-apis:xml-apis:1.0.b2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="An Apache-hosted set of DOM, SAX, and JAXP interfaces"
HOMEPAGE="https://xml.apache.org/commons/#external"
SRC_URI="
	https://repo1.maven.org/maven2/${PN}/${PN}/${PV}.b2/${P}.b2-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/${PN}/${PN}/${PV}.b2/${P}.b2.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
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

	find "${S}" -name "*.java" -exec \
		sed -i -e 's/\benum\b/enumeration/g' {} \; || \
		die "Failed to rename identifiers that are called 'enum'"
}
