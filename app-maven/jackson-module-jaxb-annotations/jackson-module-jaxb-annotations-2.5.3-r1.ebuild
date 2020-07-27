# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-module-jaxb-annotations-2.5.3.pom --download-uri https://repo1.maven.org/maven2/com/fasterxml/jackson/module/jackson-module-jaxb-annotations/2.5.3/jackson-module-jaxb-annotations-2.5.3-sources.jar --slot 0 --keywords "~amd64" --ebuild jackson-module-jaxb-annotations-2.5.3-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Support for using JAXB annotations as an alternative to \"native\" Jackson annotations, for configuring data binding."
HOMEPAGE="http://wiki.fasterxml.com/JacksonJAXBAnnotations"
SRC_URI="https://repo1.maven.org/maven2/com/fasterxml/jackson/module/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/fasterxml/jackson/module/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.fasterxml.jackson.module:jackson-module-jaxb-annotations:2.5.3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-core:2.5.3 -> >=dev-java/jackson-2.9.10:2
# com.fasterxml.jackson.core:jackson-databind:2.5.3 -> >=app-maven/jackson-databind-2.10.0:0

CDEPEND="
	>=app-maven/jackson-databind-2.10.0:0
	>=dev-java/jackson-2.9.10:2
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.xml.bind:jaxb-api:2.2 -> >=app-maven/jaxb-api-2.2:0

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=app-maven/jaxb-api-2.2:0
	)
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-2,jackson-databind"
JAVA_CLASSPATH_EXTRA="jaxb-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip -q "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
