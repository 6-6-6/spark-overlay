# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/woodstox-core-6.2.1.pom --download-uri https://repo.maven.apache.org/maven2/com/fasterxml/woodstox/woodstox-core/6.2.1/woodstox-core-6.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild woodstox-core-6.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Woodstox is a high-performance XML processor that implements Stax (JSR-173),
SAX2 and Stax2 APIs"
HOMEPAGE="https://github.com/FasterXML/woodstox"
SRC_URI="https://repo.maven.apache.org/maven2/com/fasterxml/woodstox/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.fasterxml.woodstox:woodstox-core:6.2.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.woodstox:stax2-api:4.2.1 -> >=dev-java/stax2-api-4.0.0:0

CDEPEND="
	>=dev-java/stax2-api-4.0.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.felix:org.osgi.core:1.4.0 -> >=app-maven/osgi-core-1.4.0:1

DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/osgi-core-1.4.0:1
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="stax2-api"
JAVA_GENTOO_CLASSPATH_EXTRA="osgi-core-1"
