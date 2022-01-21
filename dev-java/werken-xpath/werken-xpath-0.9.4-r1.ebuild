# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /tmp/java-ebuilder/poms/werken-xpath-0.9.4.pom --download-uri https://repo1.maven.org/maven2/werken-xpath/werken-xpath/0.9.4/werken-xpath-0.9.4.jar --slot 0 --keywords "~amd64" --ebuild werken-xpath-0.9.4.ebuild

EAPI=8

MAVEN_ID="werken-xpath:werken-xpath:0.9.4"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Werken JDOM XPath Engine"
HOMEPAGE="https://github.com/Obsidian-StudiosInc/werken-xpath"
SRC_URI="https://repo1.maven.org/maven2/${PN}/${PN}/${PV}/${P}.jar -> ${P}-sources.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"
