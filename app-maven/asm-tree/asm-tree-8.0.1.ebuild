# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/asm-tree-8.0.1.pom --download-uri https://repo.maven.apache.org/maven2/org/ow2/asm/asm-tree/8.0.1/asm-tree-8.0.1-sources.jar --slot 0 --keywords "~amd64" --ebuild asm-tree-8.0.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Tree API of ASM, a very small and fast Java bytecode manipulation framework"
HOMEPAGE="http://asm.ow2.io/"
SRC_URI="https://repo.maven.apache.org/maven2/org/ow2/asm/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.ow2.asm:asm-tree:8.0.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.ow2.asm:asm:8.0.1 -> >=dev-java/asm-3.3.1:3

CDEPEND="
	>=dev-java/asm-3.3.1:3
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="asm-3"
