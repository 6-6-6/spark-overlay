# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-core-asl-1.8.3.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/jackson/jackson-core-asl/1.8.3/jackson-core-asl-1.8.3-sources.jar --slot 0 --keywords "~amd64" --ebuild jackson-core-asl-1.8.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jackson is a high-performance JSON processor (parser, generator)"
HOMEPAGE="http://jackson.codehaus.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/jackson/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.jackson:jackson-core-asl:1.8.3"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

