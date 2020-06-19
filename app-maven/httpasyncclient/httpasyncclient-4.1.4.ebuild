# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/httpasyncclient-4.1.4.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/httpcomponents/httpasyncclient/4.1.4/httpasyncclient-4.1.4-sources.jar --slot 0 --keywords "~amd64" --ebuild httpasyncclient-4.1.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache HttpComponents AsyncClient"
HOMEPAGE="http://hc.apache.org/httpcomponents-asyncclient"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/httpcomponents/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.httpcomponents:httpasyncclient:4.1.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# commons-logging:commons-logging:1.2 -> >=dev-java/commons-logging-1.2:0
# org.apache.httpcomponents:httpclient:4.5.6 -> !!!suitble-avenVersion-not-found!!!
# org.apache.httpcomponents:httpcore:4.4.10 -> !!!suitble-avenVersion-not-found!!!
# org.apache.httpcomponents:httpcore-nio:4.4.10 -> !!!suitble-avenVersion-not-found!!!

CDEPEND="
	!!!suitble-avenVersion-not-found!!!
	>=dev-java/commons-logging-1.2:0
"


DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="commons-logging,!!!suitble-avenVersion-not-found!!!,!!!suitble-avenVersion-not-found!!!,!!!suitble-avenVersion-not-found!!!"
