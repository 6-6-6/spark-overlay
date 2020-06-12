# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/antlr4-annotations-4.7.4.pom --download-uri https://repo.maven.apache.org/maven2/com/tunnelvisionlabs/antlr4-annotations/4.7.4/antlr4-annotations-4.7.4-sources.jar --slot 0 --keywords "~amd64" --ebuild antlr4-annotations-4.7.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A set of annotations used within the ANTLR 4 Runtime"
HOMEPAGE="http://www.antlr.org/antlr4-annotations"
SRC_URI="https://repo.maven.apache.org/maven2/com/tunnelvisionlabs/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.tunnelvisionlabs:antlr4-annotations:4.7.4"



DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

