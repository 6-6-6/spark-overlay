# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/parquet-common-1.12.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/apache/parquet/parquet-common/1.12.0/parquet-common-1.12.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/apache/parquet/parquet-common/1.12.0/parquet-common-1.12.0.jar --slot 0 --keywords "~amd64" --ebuild parquet-common-1.12.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.parquet:parquet-common:1.12.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Parquet is a columnar storage format that supports nested data. This provides the java implementation."
HOMEPAGE="https://parquet.apache.org"
SRC_URI="https://repo1.maven.org/maven2/org/apache/parquet/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/parquet/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.parquet:parquet-format-structures:1.12.0 -> >=dev-java/parquet-format-structures-1.12.0:0
# org.apache.yetus:audience-annotations:0.12.0 -> >=dev-java/audience-annotations-0.12.0:0
# org.slf4j:slf4j-api:1.7.22 -> >=dev-java/slf4j-api-1.7.28:0

CDEPEND="
	>=dev-java/audience-annotations-0.12.0:0
	>=dev-java/parquet-format-structures-1.12.0:0
	>=dev-java/slf4j-api-1.7.28:0
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

JAVA_GENTOO_CLASSPATH="parquet-format-structures,audience-annotations,slf4j-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
