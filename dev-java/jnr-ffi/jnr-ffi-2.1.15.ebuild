# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jnr-ffi-2.1.15.pom --download-uri https://repo.maven.apache.org/maven2/com/github/jnr/jnr-ffi/2.1.15/jnr-ffi-2.1.15-sources.jar --slot 0 --keywords "~amd64" --ebuild jnr-ffi-2.1.15.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A library for invoking native functions from java"
HOMEPAGE="http://github.com/jnr/jnr-ffi"
SRC_URI="https://repo.maven.apache.org/maven2/com/github/jnr/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.github.jnr:jnr-ffi:2.1.15"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.jnr:jffi:1.2.23 -> >=dev-java/jffi-1.2.9:1.2
# com.github.jnr:jnr-a64asm:1.0.0 -> >=app-maven/jnr-a64asm-1.0.0:0
# com.github.jnr:jnr-x86asm:1.0.2 -> >=dev-java/jnr-x86asm-1.0.2:1.0
# org.ow2.asm:asm:7.1 -> >=dev-java/asm-8.0.1:0
# org.ow2.asm:asm-analysis:7.1 -> >=app-maven/asm-analysis-8.0.1:0
# org.ow2.asm:asm-commons:7.1 -> >=app-maven/asm-commons-8.0.1:0
# org.ow2.asm:asm-tree:7.1 -> >=app-maven/asm-tree-8.0.1:0
# org.ow2.asm:asm-util:7.1 -> >=app-maven/asm-util-8.0.1:0

CDEPEND="
	>=app-maven/asm-analysis-8.0.1:0
	>=app-maven/asm-commons-8.0.1:0
	>=app-maven/asm-tree-8.0.1:0
	>=app-maven/asm-util-8.0.1:0
	>=app-maven/jnr-a64asm-1.0.0:0
	>=dev-java/asm-8.0.1:0
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
# com.github.jnr:jffi:1.2.23 -> >=dev-java/jffi-1.2.9:1.2
RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}
	>=dev-java/jffi-1.2.9:1.2
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jffi-1.2,jnr-a64asm,jnr-x86asm-1.0,asm,asm-analysis,asm-commons,asm-tree,asm-util,jffi-1.2"
