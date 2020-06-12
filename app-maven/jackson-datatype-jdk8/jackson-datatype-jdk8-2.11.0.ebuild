# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-datatype-jdk8-2.11.0.pom --download-uri https://repo.maven.apache.org/maven2/com/fasterxml/jackson/datatype/jackson-datatype-jdk8/2.11.0/jackson-datatype-jdk8-2.11.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jackson-datatype-jdk8-2.11.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Add-on module for Jackson (http://jackson.codehaus.org) to support
JDK 8 data types."
HOMEPAGE="https://github.com/FasterXML/jackson-modules-java8/jackson-datatype-jdk8"
SRC_URI="https://repo.maven.apache.org/maven2/com/fasterxml/jackson/datatype/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.fasterxml.jackson.datatype:jackson-datatype-jdk8:2.11.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-core:2.11.0 -> >=dev-java/jackson-2.9.10:2
# com.fasterxml.jackson.core:jackson-databind:2.11.0 -> >=dev-java/jackson-databind-2.11.0:0

CDEPEND="
	>=dev-java/jackson-2.9.10:2
	>=dev-java/jackson-databind-2.11.0:0
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

JAVA_GENTOO_CLASSPATH="jackson-2,jackson-databind"
