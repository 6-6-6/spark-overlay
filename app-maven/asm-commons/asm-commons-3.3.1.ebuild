# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/asm-commons-3.3.1.pom --download-uri https://repo.maven.apache.org/maven2/asm/asm-commons/3.3.1/asm-commons-3.3.1.jar --slot 0 --keywords "~amd64" --ebuild asm-commons-3.3.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="A very small and fast Java bytecode manipulation framework"
HOMEPAGE="http://asm.objectweb.org/asm-commons/"
SRC_URI="https://repo.maven.apache.org/maven2/asm/${PN}/${PV}/${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="asm:asm-commons:3.3.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# asm:asm-tree:3.3.1 -> >=app-maven/asm-tree-3.3.1:0

CDEPEND="
	>=app-maven/asm-tree-3.3.1:0
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

JAVA_GENTOO_CLASSPATH="asm-tree"
