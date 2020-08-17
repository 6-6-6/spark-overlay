# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/lucene-analyzers-common-7.6.0.pom --download-uri https://repo1.maven.org/maven2/org/apache/lucene/lucene-analyzers-common/7.6.0/lucene-analyzers-common-7.6.0-sources.jar --slot 0 --keywords "~amd64" --ebuild lucene-analyzers-common-7.6.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.lucene:lucene-analyzers-common:7.6.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Additional Analyzers"
HOMEPAGE="http://lucene.apache.org/lucene-parent/lucene-analyzers-common"
SRC_URI="https://repo1.maven.org/maven2/org/apache/lucene/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/lucene/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.lucene:lucene-core:7.6.0 -> >=dev-java/lucene-7.6.0:0

CDEPEND="
	>=dev-java/lucene-7.6.0:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="lucene"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
