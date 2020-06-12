# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.xml.ws-api-3.0.0-RC3.pom --download-uri https://repo.maven.apache.org/maven2/jakarta/xml/ws/jakarta.xml.ws-api/3.0.0-RC3/jakarta.xml.ws-api-3.0.0-RC3-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-xml-ws-api-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta XML Web Services API"
HOMEPAGE="https://github.com/eclipse-ee4j/jax-ws-api"
SRC_URI="https://repo.maven.apache.org/maven2/jakarta/xml/ws/jakarta.xml.ws-api/${PV}-RC3/jakarta.xml.ws-api-${PV}-RC3-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jakarta.xml.ws:jakarta.xml.ws-api:3.0.0-RC3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.xml.ws-api-${PV}-RC3.pom
# jakarta.jws:jakarta.jws-api:3.0.0-RC2 -> >=app-maven/jakarta-jws-api-3.0.0:0
# jakarta.xml.bind:jakarta.xml.bind-api:3.0.0-RC3 -> >=app-maven/jakarta-xml-bind-api-3.0.0:0
# jakarta.xml.soap:jakarta.xml.soap-api:2.0.0-RC3 -> >=app-maven/jakarta-xml-soap-api-2.0.0:0

CDEPEND="
	>=app-maven/jakarta-jws-api-3.0.0:0
	>=app-maven/jakarta-xml-bind-api-3.0.0:0
	>=app-maven/jakarta-xml-soap-api-2.0.0:0
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

JAVA_GENTOO_CLASSPATH="jakarta-jws-api,jakarta-xml-bind-api,jakarta-xml-soap-api"
