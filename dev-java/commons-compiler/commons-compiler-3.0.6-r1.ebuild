# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-compiler-3.0.6.pom --download-uri https://repo1.maven.org/maven2/org/codehaus/janino/commons-compiler/3.0.6/commons-compiler-3.0.6-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-compiler-3.0.6-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.codehaus.janino:commons-compiler:3.0.6"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Janino is a super-small, super-fast Java compiler."
HOMEPAGE="https://github.com/janino-compiler/janino"
SRC_URI="https://repo1.maven.org/maven2/org/codehaus/janino/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/codehaus/janino/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="BSD"
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
