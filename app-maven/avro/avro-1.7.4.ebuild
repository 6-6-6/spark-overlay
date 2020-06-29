# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/avro-1.7.4.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/avro/avro/1.7.4/avro-1.7.4-sources.jar --slot 0 --keywords "~amd64" --ebuild avro-1.7.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Avro core components"
HOMEPAGE="http://avro.apache.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.avro:avro:1.7.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.thoughtworks.paranamer:paranamer:2.3 -> >=app-maven/paranamer-2.8:0
# org.apache.commons:commons-compress:1.4.1 -> >=dev-java/commons-compress-1.10:0
# org.codehaus.jackson:jackson-core-asl:1.8.8 -> >=app-maven/jackson-core-asl-1.8.8:0
# org.codehaus.jackson:jackson-mapper-asl:1.8.8 -> >=app-maven/jackson-mapper-asl-1.8.8:0
# org.slf4j:slf4j-api:1.6.4 -> >=dev-java/slf4j-ext-1.7.5:0
# org.xerial.snappy:snappy-java:1.0.4.1 -> >=dev-java/snappy-1.1.0.1:1.1

CDEPEND="
	>=app-maven/jackson-core-asl-1.8.8:0
	>=app-maven/jackson-mapper-asl-1.8.8:0
	>=app-maven/paranamer-2.8:0
	>=dev-java/commons-compress-1.10:0
	>=dev-java/slf4j-ext-1.7.5:0
	>=dev-java/snappy-1.1.0.1:1.1
"


DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.slf4j:slf4j-simple:1.6.4 -> >=dev-java/slf4j-ext-1.7.5:0
RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}
	>=dev-java/slf4j-ext-1.7.5:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="paranamer,commons-compress,jackson-core-asl,jackson-mapper-asl,slf4j-ext,snappy-1.1,slf4j-ext"
