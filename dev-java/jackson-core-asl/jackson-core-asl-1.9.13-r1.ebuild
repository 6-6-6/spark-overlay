# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-core-asl-1.9.13.pom --download-uri https://repo1.maven.org/maven2/org/codehaus/jackson/jackson-core-asl/1.9.13/jackson-core-asl-1.9.13-sources.jar --slot 0 --keywords "~amd64" --ebuild jackson-core-asl-1.9.13-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.codehaus.jackson:jackson-core-asl:1.9.13"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jackson is a high-performance JSON processor (parser, generator)"
HOMEPAGE="http://jackson.codehaus.org"
SRC_URI="https://repo1.maven.org/maven2/org/codehaus/jackson/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/codehaus/jackson/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
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
