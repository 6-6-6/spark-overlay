# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jug-2.0.0.pom --download-uri https://repo1.maven.org/maven2/org/safehaus/jug/jug/2.0.0/jug-2.0.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jug-2.0.0.ebuild

EAPI=8

MAVEN_ID="org.safehaus.jug:jug:2.0.0"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Java UUID Generator"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="https://repo1.maven.org/maven2/org/safehaus/${PN}/${PN}/${PV}/${P}-lgpl.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"
