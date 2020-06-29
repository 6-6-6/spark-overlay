# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-dataformat-yaml-2.5.3.pom --download-uri https://repo.maven.apache.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-yaml/2.5.3/jackson-dataformat-yaml-2.5.3-sources.jar --slot 0 --keywords "~amd64" --ebuild jackson-dataformat-yaml-2.5.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Support for reading and writing YAML-encoded data via Jackson abstractions."
HOMEPAGE="https://github.com/FasterXML/jackson"
SRC_URI="https://repo.maven.apache.org/maven2/com/fasterxml/jackson/dataformat/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.fasterxml.jackson.dataformat:jackson-dataformat-yaml:2.5.3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-core:2.5.3 -> >=dev-java/jackson-2.9.10:2
# com.fasterxml.jackson.core:jackson-databind:2.5.3 -> >=dev-java/jackson-databind-2.11.0:2
# org.yaml:snakeyaml:1.12 -> >=dev-java/snakeyaml-1.16:0

CDEPEND="
	>=dev-java/jackson-2.9.10:2
	>=dev-java/jackson-databind-2.11.0:2
	>=dev-java/snakeyaml-1.16:0
"


DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-2,jackson-databind-2,snakeyaml"
