# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/woodstox-core-asl-4.3.0.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/woodstox/woodstox-core-asl/4.3.0/woodstox-core-asl-4.3.0-sources.jar --slot 0 --keywords "~amd64" --ebuild woodstox-core-asl-4.3.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Woodstox is a high-performance XML processor that
implements Stax (JSR-173) and SAX2 APIs"
HOMEPAGE="http://woodstox.codehaus.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/woodstox/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.woodstox:woodstox-core-asl:4.3.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.xml.stream:stax-api:1.0-2 -> >=app-maven/stax-api-1.0.2:0
# org.codehaus.woodstox:stax2-api:3.1.4 -> >=dev-java/stax2-api-4.0.0:0

CDEPEND="
	>=app-maven/stax-api-1.0.2:0
	>=dev-java/stax2-api-4.0.0:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="stax-api,stax2-api"
