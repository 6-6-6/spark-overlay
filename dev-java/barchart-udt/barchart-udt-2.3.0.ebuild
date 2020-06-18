# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/osgi_R4_core-1.0.pom --download-uri https://repo.maven.apache.org/maven2/org/osgi/osgi_R4_core/1.0/osgi_R4_core-1.0.jar --slot 4 --keywords "~amd64" --ebuild osgi-core-bin-1.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar


DESCRIPTION="Barchart UDT [ BUNDLE ]"
HOMEPAGE="https://github.com/barchart/barchart-udt/wiki"
SRC_URI="https://repo.maven.apache.org/maven2/com/barchart/udt/${PN}-bundle/${PV}/${PN}-bundle-${PV}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.barchart.udt:barchart-udt-bundle:2.3.0"
MAVEN_PROVIDE="com.barchart.udt:barchart-udt-core:2.3.0"


DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

