# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/asm-9.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/ow2/asm/asm/9.0/asm-9.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/ow2/asm/asm/9.0/asm-9.0.jar --slot 0 --keywords "~amd64" --ebuild asm-9.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.ow2.asm:asm:9.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="ASM, a very small and fast Java bytecode manipulation framework"
HOMEPAGE="http://asm.ow2.io/"
SRC_URI="https://repo1.maven.org/maven2/org/ow2/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/ow2/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
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
