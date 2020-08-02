# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/lucene-queryparser-3.6.2.pom --download-uri https://repo1.maven.org/maven2/org/apache/lucene/lucene-queryparser/3.6.2/lucene-queryparser-3.6.2-sources.jar --slot 3.6 --keywords "~amd64" --ebuild lucene-queryparser-3.6.2-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="This is the Flexible Query Parser for apache lucene java"
HOMEPAGE="http://lucene.apache.org/java/lucene-parent/lucene-queryparser"
SRC_URI="https://repo1.maven.org/maven2/org/apache/lucene/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/lucene/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="3.6"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.lucene:lucene-queryparser:3.6.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.lucene:lucene-core:3.6.2 -> >=dev-java/lucene-3.6.2:3.6

CDEPEND="
	>=dev-java/lucene-3.6.2:3.6
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

JAVA_GENTOO_CLASSPATH="lucene-3.6"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

