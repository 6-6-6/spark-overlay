# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/relaxng-datatype-3.0.0-M4.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/xml/bind/external/relaxng-datatype/3.0.0-M4/relaxng-datatype-3.0.0-M4-sources.jar --slot 0 --keywords "~amd64" --ebuild relaxng-datatype-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="RelaxNG Datatype library."
HOMEPAGE="https://projects.eclipse.org/projects/ee4j/jaxb-external-parent/relaxng-datatype"
SRC_URI="https://repo.maven.apache.org/maven2/com/sun/xml/bind/external/${PN}/${PV}-M4/${P}-M4-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.xml.bind.external:relaxng-datatype:3.0.0-M4"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

