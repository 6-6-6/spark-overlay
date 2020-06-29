# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/plexus-interpolation-1.11.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus-interpolation/1.11/plexus-interpolation-1.11-sources.jar --slot 0 --keywords "~amd64" --ebuild plexus-interpolation-1.11.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION=""
HOMEPAGE="http://plexus.codehaus.org/plexus-components/plexus-interpolation"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/plexus/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.plexus:plexus-interpolation:1.11"



DEPEND="
	>=virtual/jdk-1.4:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.4:*
"

S="${WORKDIR}"

