# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/rngom-3.0.0-M4.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/xml/bind/external/rngom/3.0.0-M4/rngom-3.0.0-M4-sources.jar --slot 0 --keywords "~amd64" --ebuild rngom-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="RNGOM is a RelaxNG Object model library (XSOM for RelaxNG)."
HOMEPAGE="https://projects.eclipse.org/projects/ee4j/jaxb-external-parent/rngom"
SRC_URI="https://repo.maven.apache.org/maven2/com/sun/xml/bind/external/${PN}/${PV}-M4/${P}-M4-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.xml.bind.external:rngom:3.0.0-M4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M4.pom
# com.sun.xml.bind.external:relaxng-datatype:3.0.0-M4 -> >=app-maven/relaxng-datatype-3.0.0:0

CDEPEND="
	>=app-maven/relaxng-datatype-3.0.0:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="relaxng-datatype"
