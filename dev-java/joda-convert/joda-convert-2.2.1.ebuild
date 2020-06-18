# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/joda-convert-2.2.1.pom --download-uri https://repo.maven.apache.org/maven2/org/joda/joda-convert/2.2.1/joda-convert-2.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild joda-convert-2.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Library to convert Objects to and from String"
HOMEPAGE="https://www.joda.org/joda-convert/"
SRC_URI="https://repo.maven.apache.org/maven2/org/joda/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.joda:joda-convert:2.2.1"



DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

JAVA_RESOURCE_DIRS=(
	"../../../../../../../../var/lib/java-ebuilder/poms/src/main/resources"
	"../../../../../../../../var/lib/java-ebuilder/poms"
)
