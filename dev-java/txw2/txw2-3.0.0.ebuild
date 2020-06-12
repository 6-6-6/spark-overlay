# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/txw2-3.0.0-M4.pom --download-uri https://repo.maven.apache.org/maven2/org/glassfish/jaxb/txw2/3.0.0-M4/txw2-3.0.0-M4-sources.jar --slot 0 --keywords "~amd64" --ebuild txw2-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="TXW is a library that allows you to write XML documents."
HOMEPAGE="https://eclipse-ee4j.github.io/jaxb-ri/jaxb-txw-parent/txw2"
SRC_URI="https://repo.maven.apache.org/maven2/org/glassfish/jaxb/${PN}/${PV}-M4/${P}-M4-sources.jar"
LICENSE=""
SLOT="3.0"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.jaxb:txw2:3.0.0-M4"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

