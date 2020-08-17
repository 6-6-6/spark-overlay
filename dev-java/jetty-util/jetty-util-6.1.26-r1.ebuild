# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jetty-util-6.1.26.pom --download-uri https://repo1.maven.org/maven2/org/mortbay/jetty/jetty-util/6.1.26/jetty-util-6.1.26-sources.jar --slot 6 --keywords "~amd64" --ebuild jetty-util-6.1.26-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.mortbay.jetty:jetty-util:6.1.26"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Utility classes for Jetty"
HOMEPAGE="http://www.eclipse.org/jetty/jetty-parent/project/jetty-util"
SRC_URI="https://repo1.maven.org/maven2/org/mortbay/jetty/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/mortbay/jetty/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0 EPL-1.0"
SLOT="6"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.slf4j:slf4j-api:1.3.1 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/slf4j-api-1.7.7:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.mortbay.jetty:servlet-api:2.5-20081211 -> >=dev-java/servlet-api-2.5.20081211:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/servlet-api-2.5.20081211:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="slf4j-api"
JAVA_CLASSPATH_EXTRA="servlet-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
