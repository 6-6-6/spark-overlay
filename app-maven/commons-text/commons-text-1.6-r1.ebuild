# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-text-1.6.pom --download-uri https://repo1.maven.org/maven2/org/apache/commons/commons-text/1.6/commons-text-1.6-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-text-1.6-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Commons Text is a library focused on algorithms working on strings."
HOMEPAGE="http://commons.apache.org/proper/commons-text"
SRC_URI="https://repo1.maven.org/maven2/org/apache/commons/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/commons/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.commons:commons-text:1.6"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.commons:commons-lang3:3.8.1 -> >=dev-java/commons-lang-3.10:3.10

CDEPEND="
	>=dev-java/commons-lang-3.10:3.10
"


DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_ENCODING="ISO-8859-1"

JAVA_GENTOO_CLASSPATH="commons-lang-3.10"
JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=(
	"src/main/resources"
	""
)
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
