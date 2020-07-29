# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir /var/lib/java-ebuilder/poms/ --pom /var/lib/java-ebuilder/poms/barchart-udt-bundle-2.3.0.pom --download-uri https://repo.maven.apache.org/maven2/com/barchart/udt/barchart-udt-bundle/2.3.0/barchart-udt-bundle-2.3.0-sources.jar --slot 0 --keywords "~amd64" --ebuild barchart-udt-2.3.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary test"

inherit java-pkg-2 java-pkg-simple


DESCRIPTION="Barchart UDT [ BUNDLE ]"
HOMEPAGE="https://github.com/barchart/barchart-udt/wiki"
SRC_URI="https://repo.maven.apache.org/maven2/com/barchart/udt/${PN}-bundle/${PV}/${PN}-bundle-${PV}-sources.jar
		https://repo.maven.apache.org/maven2/com/barchart/udt/${PN}-bundle/${PV}/${PN}-bundle-${PV}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.barchart.udt:barchart-udt-bundle:2.3.0"
MAVEN_PROVIDES="com.barchart.udt:barchart-udt-core:2.3.0"


DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
	dev-java/slf4j-api:0
"

S="${WORKDIR}"
JAVA_SRC_DIR="src/main/java"
JAVA_GENTOO_CLASSPATH="slf4j-api"
JAVA_BINJAR_FILENAME="${PN}-bundle-${PV}.jar"
