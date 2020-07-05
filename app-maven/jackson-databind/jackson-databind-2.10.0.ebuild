# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-databind-2.10.0.pom --download-uri https://repo.maven.apache.org/maven2/com/fasterxml/jackson/core/jackson-databind/2.10.0/jackson-databind-2.10.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jackson-databind-2.10.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="General data-binding functionality for Jackson: works on core streaming API"
HOMEPAGE="http://github.com/FasterXML/jackson"
SRC_URI="https://repo.maven.apache.org/maven2/com/fasterxml/jackson/core/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.fasterxml.jackson.core:jackson-databind:2.10.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-annotations:2.10.0 -> >=dev-java/jackson-annotations-2.11.0:2
# com.fasterxml.jackson.core:jackson-core:2.10.0 -> >=dev-java/jackson-2.11.0:2

CDEPEND="
	>=dev-java/jackson-2.11.0:2
	>=dev-java/jackson-annotations-2.11.0:2
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

JAVA_GENTOO_CLASSPATH="jackson-annotations-2,jackson-2"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
