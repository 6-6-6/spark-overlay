# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jcommander-1.78.pom --download-uri https://repo.maven.apache.org/maven2/com/beust/jcommander/1.78/jcommander-1.78-sources.jar --slot 0 --keywords "~amd64" --ebuild jcommander-1.78.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Command line parser library for Java"
HOMEPAGE="https://jcommander.org"
SRC_URI="https://repo.maven.apache.org/maven2/com/beust/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.beust:jcommander:1.78"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

