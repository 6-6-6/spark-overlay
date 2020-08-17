# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jsr166y-1.7.0.pom --download-uri https://repo1.maven.org/maven2/org/codehaus/jsr166-mirror/jsr166y/1.7.0/jsr166y-1.7.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jsr166y-1.7.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.codehaus.jsr166-mirror:jsr166y:1.7.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="${MAVEN_ID}"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="https://repo1.maven.org/maven2/org/codehaus/jsr166-mirror/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/codehaus/jsr166-mirror/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
