# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/checker-qual-3.4.1.pom --download-uri https://repo.maven.apache.org/maven2/org/checkerframework/checker-qual/3.4.1/checker-qual-3.4.1-sources.jar --slot 0 --keywords "~amd64" --ebuild checker-qual-3.4.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Checker Qual is the set of annotations (qualifiers) and supporting classes
        used by the Checker Framework to type check Java source code.

        Please
        see artifact:
        org.checkerframework:checker"
HOMEPAGE="https://checkerframework.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/checkerframework/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.checkerframework:checker-qual:3.4.1"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

