# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jaxb-api-2.4.0-b180830.0359.pom --download-uri https://repo.maven.apache.org/maven2/javax/xml/bind/jaxb-api/2.4.0-b180830.0359/jaxb-api-2.4.0-b180830.0359-sources.jar --slot 0 --keywords "~amd64" --ebuild jaxb-api-2.4.0.180830.0359.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JAXB (JSR 222) API"
HOMEPAGE="https://github.com/javaee/jaxb-spec/jaxb-api"
SRC_URI="https://repo.maven.apache.org/maven2/javax/xml/bind/${PN}/2.4.0-b180830.0359/${PN}-2.4.0-b180830.0359-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="javax.xml.bind:jaxb-api:2.4.0-b180830.0359"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-2.4.0-b180830.0359.pom
# javax.activation:javax.activation-api:1.2.0 -> >=app-maven/javax-activation-api-1.2.0:0

CDEPEND="
	>=app-maven/javax-activation-api-1.2.0:0
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

JAVA_GENTOO_CLASSPATH="javax-activation-api"
