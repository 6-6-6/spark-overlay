# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/antlr4-runtime-4.7.4.pom --download-uri https://repo.maven.apache.org/maven2/com/tunnelvisionlabs/antlr4-runtime/4.7.4/antlr4-runtime-4.7.4-sources.jar --slot 0 --keywords "~amd64" --ebuild antlr4-runtime-4.7.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The ANTLR 4 Runtime (Optimized)"
HOMEPAGE="http://www.antlr.org/antlr4-runtime"
SRC_URI="https://repo.maven.apache.org/maven2/com/tunnelvisionlabs/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.tunnelvisionlabs:antlr4-runtime:4.7.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.tunnelvisionlabs:antlr4-annotations:4.7.4 -> >=app-maven/antlr4-annotations-4.7.4:0

CDEPEND="
	>=app-maven/antlr4-annotations-4.7.4:0
"


DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="antlr4-annotations"
