# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/objenesis-3.1.pom --download-uri https://repo.maven.apache.org/maven2/org/objenesis/objenesis/3.1/objenesis-3.1-sources.jar --slot 0 --keywords "~amd64" --ebuild objenesis-3.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A library for instantiating Java objects"
HOMEPAGE="http://objenesis.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.objenesis:objenesis:3.1"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

