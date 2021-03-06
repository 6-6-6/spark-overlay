# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jetty-sslengine-6.1.26.pom --download-uri https://repo1.maven.org/maven2/org/mortbay/jetty/jetty-sslengine/6.1.26/jetty-sslengine-6.1.26-sources.jar --slot 6 --keywords "~amd64" --ebuild jetty-sslengine-6.1.26-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.mortbay.jetty:jetty-sslengine:6.1.26"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Parent pom for Jetty at Codehaus"
HOMEPAGE="http://jetty.mortbay.org"
SRC_URI="https://repo1.maven.org/maven2/org/mortbay/jetty/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/mortbay/jetty/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="6"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.mortbay.jetty:jetty:6.1.26 -> >=dev-java/jetty-6.1.26:6

CDEPEND="
	>=dev-java/jetty-6.1.26:6
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jetty-6"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
