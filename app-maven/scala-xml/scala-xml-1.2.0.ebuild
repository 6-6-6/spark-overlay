# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/scala-xml_2.12-1.2.0.pom --download-uri https://repo.maven.apache.org/maven2/org/scala-lang/modules/scala-xml_2.12/1.2.0/scala-xml_2.12-1.2.0-sources.jar --slot 2.12 --keywords "~amd64" --ebuild scala-xml-1.2.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="scala-xml"
HOMEPAGE="http://www.scala-lang.org/"
SRC_URI="https://repo.maven.apache.org/maven2/org/scala-lang/modules/${PN}_2.12/${PV}/${PN}_2.12-${PV}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="2.12"
KEYWORDS="~amd64"
MAVEN_ID="org.scala-lang.modules:scala-xml_2.12:1.2.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}.pom
# org.scala-lang:scala-library:2.12.8 -> >=app-maven/scala-library-2.12.10:0

CDEPEND="
	>=app-maven/scala-library-2.12.10:0
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

JAVA_GENTOO_CLASSPATH="scala-library"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
