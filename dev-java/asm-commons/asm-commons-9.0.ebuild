# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/asm-commons-9.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/ow2/asm/asm-commons/9.0/asm-commons-9.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/ow2/asm/asm-commons/9.0/asm-commons-9.0.jar --slot 0 --keywords "~amd64" --ebuild asm-commons-9.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.ow2.asm:asm-commons:9.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Usefull class adapters based on ASM, a very small and fast Java bytecode manipulation framework"
HOMEPAGE="http://asm.ow2.io/"
SRC_URI="https://repo1.maven.org/maven2/org/ow2/asm/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/ow2/asm/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.ow2.asm:asm:9.0 -> >=dev-java/asm-9.0:0
# org.ow2.asm:asm-analysis:9.0 -> >=dev-java/asm-analysis-9.0:0
# org.ow2.asm:asm-tree:9.0 -> >=dev-java/asm-tree-9.0:0

CDEPEND="
	>=dev-java/asm-9.0:0
	>=dev-java/asm-analysis-9.0:0
	>=dev-java/asm-tree-9.0:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="asm,asm-analysis,asm-tree"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
