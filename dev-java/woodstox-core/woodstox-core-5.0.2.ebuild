# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/woodstox-core-5.0.2.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/fasterxml/woodstox/woodstox-core/5.0.2/woodstox-core-5.0.2-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/fasterxml/woodstox/woodstox-core/5.0.2/woodstox-core-5.0.2.jar --slot 0 --keywords "~amd64" --ebuild woodstox-core-5.0.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MAVEN_ID="com.fasterxml.woodstox:woodstox-core:5.0.2"
DESCRIPTION="Woodstox is a high-performance XML processor that implements Stax (JSR-173), SAX2 and Stax2 APIs"
HOMEPAGE="https://github.com/FasterXML/woodstox"
SRC_URI="https://repo1.maven.org/maven2/com/fasterxml/woodstox/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/fasterxml/woodstox/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
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
# javax.xml.stream:stax-api:1.0-2 -> java-virtuals/stax-api:0
# net.java.dev.msv:msv-core:2013.6.1 -> >=dev-java/msv-20130601:0
# net.java.dev.msv:msv-rngconverter:2013.6.1 -> >=dev-java/msv-rngconverter-2013.6.1:0
# net.java.dev.msv:xsdlib:2013.6.1 -> >=dev-java/xsdlib-20090415:0
# org.apache.felix:org.osgi.core:1.2.0 -> >=dev-java/osgi-core-1.4.0:1

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/msv-rngconverter-2013.6.1:0
	>=dev-java/msv-20130601:0
	>=dev-java/osgi-core-1.4.0:1
	>=dev-java/xsdlib-20090415:0
	java-virtuals/stax-api:0
	)
	test? (

		amd64? (
			dev-util/pkgdiff
			dev-util/japi-compliance-checker
		)
	)
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="stax2-api"
JAVA_CLASSPATH_EXTRA="stax-api,msv,msv-rngconverter,xsdlib,osgi-core-1"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TESTING_FRAMEWORKS="pkgdiff"
