# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-dataformat-xml-2.5.3.pom --download-uri https://repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-xml/2.5.3/jackson-dataformat-xml-2.5.3-sources.jar --slot 0 --keywords "~amd64" --ebuild jackson-dataformat-xml-2.5.3-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Data format extension for Jackson (http://jackson.codehaus.org) to offer
alternative support for serializing POJOs as XML and deserializing XML as pojos.
Support implemented on top of Stax API (javax.xml.stream), by implementing core Jackson Streaming API types like JsonGenerator, JsonParser and JsonFactory.
Some data-binding types overridden as well (ObjectMapper sub-classed as XmlMapper)."
HOMEPAGE="http://wiki.fasterxml.com/JacksonExtensionXmlDataBinding"
SRC_URI="https://repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.fasterxml.jackson.dataformat:jackson-dataformat-xml:2.5.3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-annotations:2.5.0 -> >=dev-java/jackson-annotations-2.9.10:2
# com.fasterxml.jackson.core:jackson-core:2.5.3 -> >=dev-java/jackson-2.9.10:2
# com.fasterxml.jackson.core:jackson-databind:2.5.3 -> >=dev-java/jackson-databind-2.10.0:0
# com.fasterxml.jackson.module:jackson-module-jaxb-annotations:2.5.3 -> >=dev-java/jackson-module-jaxb-annotations-2.5.3:0
# org.codehaus.woodstox:stax2-api:3.1.4 -> >=dev-java/stax2-api-4.0.0:0

CDEPEND="
	>=dev-java/jackson-databind-2.10.0:0
	>=dev-java/jackson-module-jaxb-annotations-2.5.3:0
	>=dev-java/jackson-2.9.10:2
	>=dev-java/jackson-annotations-2.9.10:2
	>=dev-java/stax2-api-4.0.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.xml.stream:stax-api:1.0-2 -> java-virtuals/stax-api:0

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	java-virtuals/stax-api:0
	)
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-annotations-2,jackson-2,jackson-databind,jackson-module-jaxb-annotations,stax2-api"
JAVA_CLASSPATH_EXTRA="stax-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

