# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-annotations-2.11.0.pom --download-uri https://repo.maven.apache.org/maven2/com/fasterxml/jackson/core/jackson-annotations/2.11.0/jackson-annotations-2.11.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jackson-annotations-2.11.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Core annotations used for value types, used by Jackson data binding package."
HOMEPAGE="http://github.com/FasterXML/jackson"
SRC_URI="https://repo.maven.apache.org/maven2/com/fasterxml/jackson/core/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="2"
KEYWORDS="~amd64"
MAVEN_ID="com.fasterxml.jackson.core:jackson-annotations:2.11.0"



DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

