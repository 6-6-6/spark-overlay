# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/lucene-core-7.6.0.pom --download-uri https://repo1.maven.org/maven2/org/apache/lucene/lucene-core/7.6.0/lucene-core-7.6.0-sources.jar --slot 0 --keywords "~amd64" --ebuild lucene-core-7.6.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary test"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Lucene Java Core"
HOMEPAGE="http://lucene.apache.org/lucene-parent/lucene-core"
SRC_URI="https://repo1.maven.org/maven2/org/apache/lucene/${PN}-core/${PV}/${PN}-core-${PV}-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/org/apache/lucene/${PN}-core/${PV}/${PN}-core-${PV}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.lucene:lucene-core:7.6.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip -q ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
}
