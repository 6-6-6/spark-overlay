# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/dec-0.1.2.pom --download-uri https://repo1.maven.org/maven2/org/brotli/dec/0.1.2/dec-0.1.2-sources.jar --slot 0 --keywords "~amd64" --ebuild dec-0.1.2-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.brotli:dec:0.1.2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Brotli is a generic-purpose lossless compression algorithm."
HOMEPAGE="http://brotli.org/dec"
SRC_URI="https://repo1.maven.org/maven2/org/brotli/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/brotli/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
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
