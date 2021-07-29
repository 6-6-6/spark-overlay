# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /tmp/java-ebuilder/poms/cmdreader-1.5.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/zwitserloot/cmdreader/1.5/cmdreader-1.5-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/zwitserloot/cmdreader/1.5/cmdreader-1.5.jar --slot 0 --keywords "~amd64" --ebuild cmdreader-1.5.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.zwitserloot:cmdreader:1.5"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Easy Command Line option reading in Java"
HOMEPAGE="http://github.com/rzwitserloot/com.zwitserloot.cmdreader"
SRC_URI="
	https://repo1.maven.org/maven2/com/zwitserloot/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/zwitserloot/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="MIT"
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
