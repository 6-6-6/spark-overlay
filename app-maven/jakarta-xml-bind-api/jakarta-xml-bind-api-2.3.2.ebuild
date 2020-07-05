# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.xml.bind-api-2.3.2.pom --download-uri https://repo.maven.apache.org/maven2/jakarta/xml/bind/jakarta.xml.bind-api/2.3.2/jakarta.xml.bind-api-2.3.2-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-xml-bind-api-2.3.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JAXB (JSR 222) API"
HOMEPAGE="https://github.com/eclipse-ee4j/jaxb-api/jakarta.xml.bind-api"
SRC_URI="https://repo.maven.apache.org/maven2/jakarta/xml/bind/jakarta.xml.bind-api/${PV}/jakarta.xml.bind-api-${PV}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jakarta.xml.bind:jakarta.xml.bind-api:2.3.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.xml.bind-api-${PV}.pom
# jakarta.activation:jakarta.activation-api:1.2.1 -> >=app-maven/jakarta-activation-api-1.2.1:0

CDEPEND="
	>=app-maven/jakarta-activation-api-1.2.1:0
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

JAVA_GENTOO_CLASSPATH="jakarta-activation-api"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
