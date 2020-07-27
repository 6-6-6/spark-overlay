# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/retirejs-core-3.0.1.pom --download-uri https://repo1.maven.org/maven2/com/h3xstream/retirejs/retirejs-core/3.0.1/retirejs-core-3.0.1-sources.jar --slot 0 --keywords "~amd64" --ebuild retirejs-core-3.0.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The root pom file aggregate the dependencies use by the Retire.js extensions."
HOMEPAGE="https://github.com/h3xstream/burp-retire-js/retirejs-core"
SRC_URI="https://repo1.maven.org/maven2/com/h3xstream/retirejs/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/h3xstream/retirejs/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.h3xstream.retirejs:retirejs-core:3.0.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.esotericsoftware:minlog:1.3 -> >=dev-java/minlog-1.3.1:0
# com.github.spullara.mustache.java:compiler:0.8.17 -> >=app-maven/compiler-0.8.17:0
# org.json:json:20140107 -> >=dev-java/json-20150729:0

CDEPEND="
	>=app-maven/compiler-0.8.17:0
	>=dev-java/json-20150729:0
	>=dev-java/minlog-1.3.1:0
"


DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.7:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="minlog,compiler,json"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip -q "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
