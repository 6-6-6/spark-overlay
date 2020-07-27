# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/asm-debug-all-5.0_BETA.pom --download-uri https://repo1.maven.org/maven2/org/ow2/asm/asm-debug-all/5.0_BETA/asm-debug-all-5.0_BETA-sources.jar --slot 0 --keywords "~amd64" --ebuild asm-debug-all-5.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A very small and fast Java bytecode manipulation framework"
HOMEPAGE="http://asm.objectweb.org/asm-debug-all/"
SRC_URI="https://repo1.maven.org/maven2/org/ow2/asm/${PN}/${PV}_BETA/${P}_BETA-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/ow2/asm/${PN}/${PV}_BETA/${P}_BETA.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.ow2.asm:asm-debug-all:5.0_BETA"



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

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
