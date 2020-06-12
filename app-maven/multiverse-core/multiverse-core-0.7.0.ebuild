# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/multiverse-core-0.7.0.pom --download-uri https://repo.maven.apache.org/maven2/org/multiverse/multiverse-core/0.7.0/multiverse-core-0.7.0-sources.jar --slot 0 --keywords "~amd64" --ebuild multiverse-core-0.7.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Multiverse core"
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/multiverse/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.multiverse:multiverse-core:0.7.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

