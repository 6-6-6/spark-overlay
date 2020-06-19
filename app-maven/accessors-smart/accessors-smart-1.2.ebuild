# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/accessors-smart-1.2.pom --download-uri https://repo.maven.apache.org/maven2/net/minidev/accessors-smart/1.2/accessors-smart-1.2-sources.jar --slot 0 --keywords "~amd64" --ebuild accessors-smart-1.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java reflect give poor performance on getter setter an constructor calls, accessors-smart use ASM to speed up those calls."
HOMEPAGE="http://www.minidev.net/"
SRC_URI="https://repo.maven.apache.org/maven2/net/minidev/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="net.minidev:accessors-smart:1.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.ow2.asm:asm:5.0.4 -> >=dev-java/asm-5.1:4

CDEPEND="
	>=dev-java/asm-5.1:4
"


DEPEND="
	>=virtual/jdk-1.5:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="asm-4"
