# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jetty-util-6.1.26.pom --download-uri https://repo.maven.apache.org/maven2/org/mortbay/jetty/jetty-util/6.1.26/jetty-util-6.1.26-sources.jar --slot 0 --keywords "~amd64" --ebuild jetty-util-6.1.26.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Utility classes for Jetty"
HOMEPAGE="http://www.eclipse.org/jetty/jetty-parent/project/jetty-util"
SRC_URI="https://repo.maven.apache.org/maven2/org/mortbay/jetty/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.mortbay.jetty:jetty-util:6.1.26"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.slf4j:slf4j-api:1.3.1 -> >=dev-java/slf4j-ext-1.7.5:0

CDEPEND="
	>=dev-java/slf4j-ext-1.7.5:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.mortbay.jetty:servlet-api:2.5-20081211 -> >=app-maven/servlet-api-2.5.20081211:0

DEPEND="
	>=virtual/jdk-1.4:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/servlet-api-2.5.20081211:0
"

RDEPEND="
	>=virtual/jre-1.4:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="slf4j-ext"
JAVA_CLASSPATH_EXTRA="servlet-api"
