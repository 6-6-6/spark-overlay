# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/rngom-201605.pom --download-uri https://repo1.maven.org/maven2/org/kohsuke/rngom/rngom/201605/rngom-201605-sources.jar --slot 0 --keywords "~amd64" --ebuild rngom-201605.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

MY_PV=201605

DESCRIPTION="RNGOM is an open-source Java library for parsing RELAX NG grammars."
HOMEPAGE="http://rngom.java.net/"
SRC_URI="https://repo1.maven.org/maven2/org/kohsuke/${PN}/${PN}/${MY_PV}/${PN}-${MY_PV}-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/org/kohsuke/${PN}/${PN}/${MY_PV}/${PN}-${MY_PV}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.kohsuke.rngom:rngom:201605"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.xml.stream:stax-api:1.0-2 -> >=java-virtuals/stax-api-1:0
# relaxngDatatype:relaxngDatatype:20020414 -> >=dev-java/relaxng-datatype-1.0:0

CDEPEND="
	>=dev-java/relaxng-datatype-1.0:0
	java-virtuals/stax-api:0
"


DEPEND="
	>=virtual/jdk-1.5:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="stax-api,relaxng-datatype"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
