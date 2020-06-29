# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/h2-1.4.196.pom --download-uri https://repo.maven.apache.org/maven2/com/h2database/h2/1.4.196/h2-1.4.196-sources.jar --slot 0 --keywords "~amd64" --ebuild h2-1.4.196.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="H2 Database Engine"
HOMEPAGE="http://www.h2database.com"
SRC_URI="https://repo.maven.apache.org/maven2/com/${PN}database/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.h2database:h2:1.4.196"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

