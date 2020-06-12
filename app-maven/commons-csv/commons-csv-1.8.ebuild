# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-csv-1.8.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/commons/commons-csv/1.8/commons-csv-1.8-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-csv-1.8.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Apache Commons CSV library provides a simple interface for reading and writing CSV files of various types."
HOMEPAGE="https://commons.apache.org/proper/commons-csv/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/commons/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.commons:commons-csv:1.8"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_RESOURCE_DIRS=(
	"../../../../../../../../var/lib/java-ebuilder/poms/src/main/resources"
	"../../../../../../../../var/lib/java-ebuilder/poms"
)
