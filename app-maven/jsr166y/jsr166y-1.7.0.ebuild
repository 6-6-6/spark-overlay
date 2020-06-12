# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jsr166y-1.7.0.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/jsr166-mirror/jsr166y/1.7.0/jsr166y-1.7.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jsr166y-1.7.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/jsr166-mirror/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.jsr166-mirror:jsr166y:1.7.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

