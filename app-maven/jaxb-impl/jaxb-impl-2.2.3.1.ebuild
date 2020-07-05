# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jaxb-impl-2.2.3-1.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/xml/bind/jaxb-impl/2.2.3-1/jaxb-impl-2.2.3-1-sources.jar --slot 0 --keywords "~amd64" --ebuild jaxb-impl-2.2.3.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JAXB (JSR 222) reference implementation"
HOMEPAGE="http://jaxb.java.net/"
SRC_URI="https://repo.maven.apache.org/maven2/com/sun/xml/bind/${PN}/2.2.3-1/${PN}-2.2.3-1-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.xml.bind:jaxb-impl:2.2.3-1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-2.2.3-1.pom
# javax.xml.bind:jaxb-api:2.2.2 -> >=app-maven/jaxb-api-2.2.2:0

CDEPEND="
	>=app-maven/jaxb-api-2.2.2:0
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

JAVA_GENTOO_CLASSPATH="jaxb-api"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
