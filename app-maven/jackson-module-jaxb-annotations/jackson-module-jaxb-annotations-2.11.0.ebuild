# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-module-jaxb-annotations-2.11.0.pom --download-uri https://repo.maven.apache.org/maven2/com/fasterxml/jackson/module/jackson-module-jaxb-annotations/2.11.0/jackson-module-jaxb-annotations-2.11.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jackson-module-jaxb-annotations-2.11.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Support for using JAXB annotations as an alternative to \"native\" Jackson annotations, for configuring
data-binding."
HOMEPAGE="https://github.com/FasterXML/jackson-modules-base"
SRC_URI="https://repo.maven.apache.org/maven2/com/fasterxml/jackson/module/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.fasterxml.jackson.module:jackson-module-jaxb-annotations:2.11.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-annotations:2.11.0 -> >=dev-java/jackson-annotations-2.9.10:2
# com.fasterxml.jackson.core:jackson-core:2.11.0 -> >=dev-java/jackson-2.9.10:2
# com.fasterxml.jackson.core:jackson-databind:2.11.0 -> >=dev-java/jackson-databind-2.11.0:0
# jakarta.activation:jakarta.activation-api:1.2.1 -> >=app-maven/jakarta-activation-api-2.0.0:0
# jakarta.xml.bind:jakarta.xml.bind-api:2.3.2 -> >=app-maven/jakarta-xml-bind-api-3.0.0:0

CDEPEND="
	>=app-maven/jakarta-activation-api-2.0.0:0
	>=app-maven/jakarta-xml-bind-api-3.0.0:0
	>=dev-java/jackson-2.9.10:2
	>=dev-java/jackson-annotations-2.9.10:2
	>=dev-java/jackson-databind-2.11.0:0
"


DEPEND="
	>=virtual/jdk-1.7:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.7:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-annotations-2,jackson-2,jackson-databind,jakarta-activation-api,jakarta-xml-bind-api"
