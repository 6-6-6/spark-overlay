# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/xercesMinimal-1.9.6.2.pom --download-uri https://repo1.maven.org/maven2/nekohtml/xercesMinimal/1.9.6.2/xercesMinimal-1.9.6.2.jar --slot 0 --keywords "~amd64" --ebuild xercesMinimal-1.9.6.2.ebuild

EAPI=8

MAVEN_ID="nekohtml:xercesMinimal:1.9.6.2"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="NekoHTML Xerces minimal"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="https://repo1.maven.org/maven2/nekohtml/${PN}/${PV}/${P}.jar"
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
