# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom jakarta.xml.bind-api-4.0.2.pom --download-uri https://repo1.maven.org/maven2/jakarta/xml/bind/jakarta.xml.bind-api/4.0.2/jakarta.xml.bind-api-4.0.2-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-xml-soap-api-4.0.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="jakarta.xml.bind:jakarta.xml.bind-api:4.0.2"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta XML Binding API"
HOMEPAGE="https://github.com/jakartaee/jaxb-api/jakarta.xml.bind-api"
SRC_URI="https://repo1.maven.org/maven2/jakarta/xml/bind/jakarta.xml.bind-api/${PV}/jakarta.xml.bind-api-${PV}-sources.jar -> ${P}-sources.jar"
LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: jakarta.xml.bind-api-${PV}.pom
# jakarta.activation:jakarta.activation-api:2.1.3 -> !!!groupId-not-found!!!

CDEPEND="
	dev-java/jakarta-activation-api:2
"

DEPEND="
	>=virtual/jdk-11:*
	app-arch/unzip
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-11:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jakarta-activation-api-2"
JAVA_SRC_DIR="jakarta"
