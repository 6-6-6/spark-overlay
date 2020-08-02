# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jug-2.0.0.pom --download-uri https://repo1.maven.org/maven2/org/safehaus/jug/jug/2.0.0/jug-2.0.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jug-2.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="${MAVEN_ID}"
HOMEPAGE="http://jug.safehaus.org/"
SRC_URI="https://repo1.maven.org/maven2/org/safehaus/${PN}/${PN}/${PV}/${P}-lgpl.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.safehaus.jug:jug:2.0.0"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"
