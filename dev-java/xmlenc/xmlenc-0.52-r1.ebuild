# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/xmlenc-0.52.pom --download-uri https://repo1.maven.org/maven2/xmlenc/xmlenc/0.52/xmlenc-0.52.jar --slot 0 --keywords "~amd64" --ebuild xmlenc-0.52.ebuild

EAPI=8

MAVEN_ID="xmlenc:xmlenc:0.52"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Lightweight XML encoding library for Java, optimized for performance"
HOMEPAGE="https://sourceforge.net/projects/xmlenc/"
SRC_URI="https://repo1.maven.org/maven2/${PN}/${PN}/${PV}/${P}.jar"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"
