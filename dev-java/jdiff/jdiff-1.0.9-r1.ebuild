# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jdiff-1.0.9.pom --download-uri https://repo1.maven.org/maven2/jdiff/jdiff/1.0.9/jdiff-1.0.9.jar --slot 0 --keywords "~amd64" --ebuild jdiff-1.0.9.ebuild

EAPI=8

MAVEN_ID="jdiff:jdiff:1.0.9"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="An HTML Report of API Differences"
HOMEPAGE="http://javadiff.sourceforge.net/"
SRC_URI="https://repo1.maven.org/maven2/${PN}/${PN}/${PV}/${P}.jar"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"
