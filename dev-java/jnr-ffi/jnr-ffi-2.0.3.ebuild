# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jnr-ffi-2.0.3.pom --download-uri https://repo.maven.apache.org/maven2/com/github/jnr/jnr-ffi/2.0.3/jnr-ffi-2.0.3-sources.jar --slot 0 --keywords "~amd64" --ebuild jnr-ffi-2.0.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A library for invoking native functions from java"
HOMEPAGE="http://github.com/jnr/jnr-ffi"
SRC_URI="https://repo.maven.apache.org/maven2/com/github/jnr/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.github.jnr:jnr-ffi:2.0.3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.jnr:jffi:1.2.9 -> >=dev-java/jffi-1.2.9:1.2
# com.github.jnr:jnr-x86asm:1.0.2 -> >=dev-java/jnr-x86asm-1.0.2:1.0
# org.ow2.asm:asm:5.0.3 -> >=dev-java/asm-5.0.3:4
# org.ow2.asm:asm-analysis:5.0.3 -> >=app-maven/asm-analysis-5.0.3:0
# org.ow2.asm:asm-commons:5.0.3 -> >=app-maven/asm-commons-5.0.3:0
# org.ow2.asm:asm-tree:5.0.3 -> >=app-maven/asm-tree-5.0.3:0
# org.ow2.asm:asm-util:5.0.3 -> >=app-maven/asm-util-5.0.3:0

CDEPEND="
	>=app-maven/asm-analysis-5.0.3:0
	>=app-maven/asm-commons-5.0.3:0
	>=app-maven/asm-tree-5.0.3:0
	>=app-maven/asm-util-5.0.3:0
	>=dev-java/asm-5.0.3:4
	>=dev-java/jffi-1.2.9:1.2
	>=dev-java/jnr-x86asm-1.0.2:1.0
"


DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.jnr:jffi:1.2.9 -> >=dev-java/jffi-1.2.9:1.2
RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}
	>=dev-java/jffi-1.2.9:1.2
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jffi-1.2,jnr-x86asm-1.0,asm-4,asm-analysis,asm-commons,asm-tree,asm-util,jffi-1.2"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
