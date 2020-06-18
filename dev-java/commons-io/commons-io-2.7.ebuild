# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-io-2.7.pom --download-uri https://repo.maven.apache.org/maven2/commons-io/commons-io/2.7/commons-io-2.7-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-io-2.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Apache Commons IO library contains utility classes, stream implementations, file filters,
file comparators, endian transformation classes, and much more."
HOMEPAGE="https://commons.apache.org/proper/commons-io/"
SRC_URI="https://repo.maven.apache.org/maven2/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="commons-io:commons-io:2.7"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_ENCODING="iso-8859-1"

JAVA_RESOURCE_DIRS=(
	"../../../../../../../../var/lib/java-ebuilder/poms/src/main/resources"
	"../../../../../../../../var/lib/java-ebuilder/poms"
)
