# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.fasterxml.jackson.dataformat:jackson-dataformat-xml:2.8.3"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Data format extension for Jackson for serializing and deserializing POJOs"
HOMEPAGE="http://wiki.fasterxml.com/JacksonExtensionXmlDataBinding"
SRC_URI="
	https://repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-annotations:2.8.0 -> >=dev-java/jackson-annotations-2.9.10:2
# com.fasterxml.jackson.core:jackson-core:2.8.3 -> >=dev-java/jackson-2.9.10:2
# com.fasterxml.jackson.core:jackson-databind:2.8.3 -> >=dev-java/jackson-databind-2.10.0:0
# com.fasterxml.jackson.module:jackson-module-jaxb-annotations:2.8.3 -> >=dev-java/jackson-module-jaxb-annotations-2.8.3:0
# com.fasterxml.woodstox:woodstox-core:5.0.2 -> >=dev-java/woodstox-core-5.0.2:0
# org.codehaus.woodstox:stax2-api:3.1.4 -> >=dev-java/stax2-api-4.0.0:0

CDEPEND="
	>=dev-java/woodstox-core-5.0.2:0
	>=dev-java/jackson-2.9.10:2
	>=dev-java/jackson-annotations-2.9.10:2
	>=dev-java/jackson-databind-2.10.0:0
	>=dev-java/jackson-module-jaxb-annotations-2.8.3:0
	>=dev-java/stax2-api-4.0.0:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-annotations-2,jackson-2,jackson-databind,jackson-module-jaxb-annotations,woodstox-core,stax2-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
