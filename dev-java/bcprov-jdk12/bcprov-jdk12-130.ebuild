# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/bcprov-jdk12-130.pom --download-uri https://repo.maven.apache.org/maven2/org/bouncycastle/bcprov-jdk12/130/bcprov-jdk12-130.jar --slot 0 --keywords "~amd64" --ebuild bcprov-jdk12-130.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/bouncycastle/${PN}/${PV}/${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.bouncycastle:bcprov-jdk12:130"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

