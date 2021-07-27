# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.fasterxml.woodstox:woodstox-core:5.0.2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="XML processor that implements Stax (JSR-173), SAX2 and Stax2 APIs"
HOMEPAGE="https://github.com/FasterXML/woodstox"
SRC_URI="
	https://repo1.maven.org/maven2/com/fasterxml/woodstox/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/fasterxml/woodstox/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.woodstox:stax2-api:3.1.4 -> >=dev-java/stax2-api-4.0.0:0

CDEPEND="
	>=dev-java/stax2-api-4.0.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# net.java.dev.msv:msv-core:2013.6.1 -> >=dev-java/msv-20130601:0
# net.java.dev.msv:msv-rngconverter:2013.6.1 -> >=dev-java/msv-rngconverter-2013.6.1:0
# net.java.dev.msv:xsdlib:2013.6.1 -> >=dev-java/xsdlib-20090415:0
# org.apache.felix:org.osgi.core:1.2.0 -> >=dev-java/osgi-core-1.4.0:1

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/msv-rngconverter-2013.6.1:0
		>=dev-java/msv-20130601:0
		>=dev-java/osgi-core-1.4.0:1
		>=dev-java/xsdlib-20090415:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="stax2-api"
JAVA_CLASSPATH_EXTRA="msv,msv-rngconverter,xsdlib,osgi-core-1"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
