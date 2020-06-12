# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/httpclient5-5.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/httpcomponents/client5/httpclient5/5.0/httpclient5-5.0-sources.jar --slot 0 --keywords "~amd64" --ebuild httpclient5-5.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache HttpComponents Client"
HOMEPAGE="http://hc.apache.org/httpcomponents-client"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/httpcomponents/client5/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.httpcomponents.client5:httpclient5:5.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# commons-codec:commons-codec:1.13 -> >=dev-java/commons-codec-1.7:0
# org.apache.httpcomponents.core5:httpcore5:5.0 -> >=app-maven/httpcore5-5.0:0
# org.apache.httpcomponents.core5:httpcore5-h2:5.0 -> >=app-maven/httpcore5-h2-5.0:0
# org.conscrypt:conscrypt-openjdk-uber:2.2.1 -> >=app-maven/conscrypt-openjdk-uber-2.4.0:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=app-maven/conscrypt-openjdk-uber-2.4.0:0
	>=app-maven/httpcore5-5.0:0
	>=app-maven/httpcore5-h2-5.0:0
	>=dev-java/commons-codec-1.7:0
	>=dev-java/slf4j-api-1.7.7:0
"


DEPEND="
	>=virtual/jdk-1.7:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.7:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="commons-codec,httpcore5,httpcore5-h2,conscrypt-openjdk-uber,slf4j-api"
