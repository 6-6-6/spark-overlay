# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /tmp/java-ebuilder/poms/stax2-api-4.2.1.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/codehaus/woodstox/stax2-api/4.2.1/stax2-api-4.2.1-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/codehaus/woodstox/stax2-api/4.2.1/stax2-api-4.2.1.jar --slot 0 --keywords "~amd64" --ebuild stax2-api-4.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.codehaus.woodstox:stax2-api:4.2.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Extended Stax (STandard Api for Xml procesing) API"
HOMEPAGE="https://github.com/FasterXML/stax2-api"
SRC_URI="
	https://github.com/FasterXML/${PN}/archive/${P}.tar.gz
	https://repo1.maven.org/maven2/org/codehaus/woodstox/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

BDEPEND="app-arch/unzip"

S="${WORKDIR}/${PN}-${P}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_install() {
	java-pkg-simple_src_install
	dodoc README.md release-notes/VERSION
}
