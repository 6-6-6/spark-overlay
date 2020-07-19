# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-io-2.6.pom --download-uri https://repo.maven.apache.org/maven2/commons-io/commons-io/2.6/commons-io-2.6-sources.jar --slot 1 --keywords "~amd64" --ebuild commons-io-2.6.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary test"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Apache Commons IO library contains utility classes, stream implementations, file filters,
file comparators, endian transformation classes, and much more."
HOMEPAGE="http://commons.apache.org/proper/commons-io/"
SRC_URI="https://repo.maven.apache.org/maven2/${PN}/${PN}/${PV}/${P}-sources.jar -> ${P}.jar
	https://repo.maven.apache.org/maven2/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
	https://repo.maven.apache.org/maven2/${PN}/${PN}/${PV}/${P}-test-sources.jar -> ${P}-test.jar"
LICENSE=""
SLOT="1"
KEYWORDS="~amd64"
MAVEN_ID="commons-io:commons-io:2.6"



DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.7:*
"

S="${WORKDIR}"

JAVA_ENCODING="iso-8859-1"

JAVA_SRC_DIR="src/main/java"
#JAVA_RESOURCE_DIRS=(
#	"src/main/resources"
#	"."
#)

JAVA_TESTING_FRAMEWORK="junit"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS=("src/test/java")
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	mkdir -p ${S}/${JAVA_TEST_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
	unzip ${DISTDIR}/${P}-test.jar -d ${S}/${JAVA_TEST_SRC_DIR} || die
}
