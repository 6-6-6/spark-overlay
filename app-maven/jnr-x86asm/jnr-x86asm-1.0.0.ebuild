# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jnr-x86asm-1.0.0.pom --download-uri https://repo1.maven.org/maven2/org/jruby/extras/jnr-x86asm/1.0.0/jnr-x86asm-1.0.0.jar --slot 0 --keywords "~amd64" --ebuild jnr-x86asm-1.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="A pure-java X86 and X86_64 assembler"
HOMEPAGE="http://github.com/wmeissner/jnr-x86asm"
SRC_URI="https://repo1.maven.org/maven2/org/jruby/extras/${PN}/${PV}/${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jruby.extras:jnr-x86asm:1.0.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
