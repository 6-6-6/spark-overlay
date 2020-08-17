# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/servlet-api-2.5-20081211.pom --download-uri https://repo1.maven.org/maven2/org/mortbay/jetty/servlet-api/2.5-20081211/servlet-api-2.5-20081211-sources.jar --slot 0 --keywords "~amd64" --ebuild servlet-api-2.5.20081211-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.mortbay.jetty:servlet-api:2.5-20081211"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Servlet Specification API"
HOMEPAGE="http://jetty.mortbay.org/servlet-api"
SRC_URI="https://repo1.maven.org/maven2/org/mortbay/jetty/${PN}/2.5-20081211/${PN}-2.5-20081211-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/mortbay/jetty/${PN}/2.5-20081211/${PN}-2.5-20081211.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
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
