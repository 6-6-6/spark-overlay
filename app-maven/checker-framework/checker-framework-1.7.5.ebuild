# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/checker-framework-1.7.5.pom --download-uri https://repo.maven.apache.org/maven2/edu/washington/cs/types/checker/checker-framework/1.7.5/checker-framework-1.7.5-sources.jar --slot 0 --keywords "~amd64" --ebuild checker-framework-1.7.5.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Checker framework"
HOMEPAGE="http://types.cs.washington.edu/checker-framework"
SRC_URI="https://repo.maven.apache.org/maven2/edu/washington/cs/types/checker/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="edu.washington.cs.types.checker:checker-framework:1.7.5"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

