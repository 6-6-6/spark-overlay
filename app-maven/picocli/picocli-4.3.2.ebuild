# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/picocli-4.3.2.pom --download-uri https://repo.maven.apache.org/maven2/info/picocli/picocli/4.3.2/picocli-4.3.2-sources.jar --slot 0 --keywords "~amd64" --ebuild picocli-4.3.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java command line parser with both an annotations API and a programmatic API. Usage help with ANSI styles and colors. Autocomplete. Nested subcommands. Easily included as source to avoid adding a dependency."
HOMEPAGE="http://picocli.info"
SRC_URI="https://repo.maven.apache.org/maven2/info/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="info.picocli:picocli:4.3.2"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

