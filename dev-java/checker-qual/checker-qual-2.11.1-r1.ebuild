# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/checker-qual-2.11.1.pom --download-uri https://repo1.maven.org/maven2/org/checkerframework/checker-qual/2.11.1/checker-qual-2.11.1-sources.jar --slot 0 --keywords "~amd64" --ebuild checker-qual-2.11.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.checkerframework:checker-qual:2.11.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Checker Qual is the set of annotations (qualifiers) and supporting classes used by the Checker Framework to type check Java source code.  Please see artifact: org.checkerframework:checker"
HOMEPAGE="https://checkerframework.org"
SRC_URI="https://repo1.maven.org/maven2/org/checkerframework/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/checkerframework/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
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
