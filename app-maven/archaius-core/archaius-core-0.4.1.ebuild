# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/archaius-core-0.4.1.pom --download-uri https://repo.maven.apache.org/maven2/com/netflix/archaius/archaius-core/0.4.1/archaius-core-0.4.1-sources.jar --slot 0 --keywords "~amd64" --ebuild archaius-core-0.4.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Sonatype helps open source projects to set up Maven repositories on https://oss.sonatype.org/"
HOMEPAGE="http://nexus.sonatype.org/oss-repository-hosting.html/archaius-core"
SRC_URI="https://repo.maven.apache.org/maven2/com/netflix/archaius/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.netflix.archaius:archaius-core:0.4.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# commons-configuration:commons-configuration:1.8 -> >=dev-java/commons-configuration-1.8:0
# org.slf4j:slf4j-api:1.6.4 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/commons-configuration-1.8:0
	>=dev-java/slf4j-api-1.7.7:0
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

JAVA_GENTOO_CLASSPATH="commons-configuration,slf4j-api"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
