# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jnr-constants-0.9.15.pom --download-uri https://repo.maven.apache.org/maven2/com/github/jnr/jnr-constants/0.9.15/jnr-constants-0.9.15-sources.jar --slot 0 --keywords "~amd64" --ebuild jnr-constants-0.9.15.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A set of platform constants (e.g. errno values)"
HOMEPAGE="http://github.com/jnr/jnr-constants"
SRC_URI="https://repo.maven.apache.org/maven2/com/github/jnr/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.github.jnr:jnr-constants:0.9.15"



DEPEND="
	>=virtual/jdk-1.5:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.5:*
"

S="${WORKDIR}"

