# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.xml.bind-api-3.0.0-RC3.pom --download-uri https://repo1.maven.org/maven2/jakarta/xml/bind/jakarta.xml.bind-api/3.0.0-RC3/jakarta.xml.bind-api-3.0.0-RC3-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-xml-bind-api-3.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta XML Binding API"
HOMEPAGE="https://github.com/eclipse-ee4j/jaxb-api/jakarta.xml.bind-api"
SRC_URI="https://repo1.maven.org/maven2/jakarta/xml/bind/jakarta.xml.bind-api/${PV}-RC3/jakarta.xml.bind-api-${PV}-RC3-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/jakarta/xml/bind/jakarta.xml.bind-api/${PV}-RC3/jakarta.xml.bind-api-${PV}-RC3.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jakarta.xml.bind:jakarta.xml.bind-api:3.0.0-RC3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.xml.bind-api-${PV}-RC3.pom
# jakarta.activation:jakarta.activation-api:2.0.0-RC3 -> >=app-maven/jakarta-activation-api-2.0.0:0

CDEPEND="
	>=app-maven/jakarta-activation-api-2.0.0:0
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
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jakarta-activation-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
