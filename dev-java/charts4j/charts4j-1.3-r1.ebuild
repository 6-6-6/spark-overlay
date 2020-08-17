# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/charts4j-1.3.pom --download-uri https://repo1.maven.org/maven2/com/googlecode/charts4j/charts4j/1.3/charts4j-1.3-sources.jar --slot 0 --keywords "~amd64" --ebuild charts4j-1.3-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.googlecode.charts4j:charts4j:1.3"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="charts4j is a free, lightweight charts and graphs Java API. It enables developers to programmatically create the charts available in the Google Chart API through a straightforward and intuitive Java API."
HOMEPAGE="http://charts4j.googlecode.com"
SRC_URI="https://repo1.maven.org/maven2/com/googlecode/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/googlecode/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
