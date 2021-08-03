# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /tmp/java-ebuilder/poms/lucene-spatial-4.0.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/apache/lucene/lucene-spatial/4.0.0/lucene-spatial-4.0.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/apache/lucene/lucene-spatial/4.0.0/lucene-spatial-4.0.0.jar --slot 4.0 --keywords "~amd64" --ebuild lucene-spatial-4.0.0.ebuild

EAPI=7

MAVEN_ID="org.apache.lucene:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Spatial Strategies for Apache Lucene"
HOMEPAGE="https://lucene.apache.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/lucene/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/lucene/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"

# Common dependencies
# POM: /tmp/java-ebuilder/poms/${P}.pom
# org.apache.lucene:lucene-core:4.0.0 -> dev-java/lucene:4.0
# org.apache.lucene:lucene-queries:4.0.0 -> dev-java/lucene-queries:4.0
# com.spatial4j:spatial4j:0.3 -> >=dev-java/spatial4j-0.3:0

CP_DEPEND="
	~dev-java/lucene-${PV}:4.0
	~dev-java/lucene-queries-${PV}:4.0
	>=dev-java/spatial4j-0.3:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
