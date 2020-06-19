# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-dataformat-xml-2.11.0.pom --download-uri https://repo.maven.apache.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-xml/2.11.0/jackson-dataformat-xml-2.11.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jackson-dataformat-xml-2.11.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Data format extension for Jackson (http://jackson.codehaus.org) to offer
alternative support for serializing POJOs as XML and deserializing XML as pojos.
Support implemented on top of Stax API (javax.xml.stream), by implementing core Jackson Streaming API types like JsonGenerator, JsonParser and JsonFactory.
Some data-binding types overridden as well (ObjectMapper sub-classed as XmlMapper)."
HOMEPAGE="https://github.com/FasterXML/jackson-dataformat-xml"
SRC_URI="https://repo.maven.apache.org/maven2/com/fasterxml/jackson/dataformat/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.fasterxml.jackson.dataformat:jackson-dataformat-xml:2.11.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-annotations:2.11.0 -> >=dev-java/jackson-annotations-2.11.0:2
# com.fasterxml.jackson.core:jackson-core:2.11.0 -> >=dev-java/jackson-2.11.0:2
# com.fasterxml.jackson.core:jackson-databind:2.11.0 -> >=dev-java/jackson-databind-2.11.0:2
# com.fasterxml.jackson.module:jackson-module-jaxb-annotations:2.11.0 -> >=app-maven/jackson-module-jaxb-annotations-2.11.0:0
# com.fasterxml.woodstox:woodstox-core:6.2.0 -> >=app-maven/woodstox-core-6.2.1:0
# org.codehaus.woodstox:stax2-api:4.2 -> >=dev-java/stax2-api-4.2.1:0

CDEPEND="
	>=app-maven/jackson-module-jaxb-annotations-2.11.0:0
	>=app-maven/woodstox-core-6.2.1:0
	>=dev-java/jackson-2.11.0:2
	>=dev-java/jackson-annotations-2.11.0:2
	>=dev-java/jackson-databind-2.11.0:2
	>=dev-java/stax2-api-4.2.1:0
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

JAVA_GENTOO_CLASSPATH="jackson-annotations-2,jackson-2,jackson-databind-2,jackson-module-jaxb-annotations,woodstox-core,stax2-api"
