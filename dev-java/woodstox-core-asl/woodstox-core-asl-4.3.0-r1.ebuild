# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/woodstox-core-asl-4.3.0.pom --download-uri https://repo1.maven.org/maven2/org/codehaus/woodstox/woodstox-core-asl/4.3.0/woodstox-core-asl-4.3.0-sources.jar --slot 0 --keywords "~amd64" --ebuild woodstox-core-asl-4.3.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.codehaus.woodstox:woodstox-core-asl:4.3.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Woodstox is a high-performance XML processor that implements Stax (JSR-173) and SAX2 APIs"
HOMEPAGE="http://woodstox.codehaus.org"
SRC_URI="https://repo1.maven.org/maven2/org/codehaus/woodstox/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/codehaus/woodstox/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.xml.stream:stax-api:1.0-2 -> java-virtuals/stax-api:0
# org.codehaus.woodstox:stax2-api:3.1.4 -> >=dev-java/stax2-api-4.0.0:0

CDEPEND="
	>=dev-java/stax2-api-4.0.0:0
	java-virtuals/stax-api:0
	dev-java/relaxng-datatype:0
	dev-java/osgi-framework:1
	dev-java/msv:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="stax-api,stax2-api,relaxng-datatype,osgi-framework-1,msv"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
