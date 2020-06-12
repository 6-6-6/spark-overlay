# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/apiguardian-api-1.1.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apiguardian/apiguardian-api/1.1.0/apiguardian-api-1.1.0-sources.jar --slot 0 --keywords "~amd64" --ebuild apiguardian-api-1.1.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="@API Guardian"
HOMEPAGE="https://github.com/apiguardian-team/apiguardian"
SRC_URI="https://repo.maven.apache.org/maven2/org/apiguardian/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apiguardian:apiguardian-api:1.1.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

