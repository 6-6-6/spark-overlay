# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/parquet-jackson-1.12.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/apache/parquet/parquet-jackson/1.12.0/parquet-jackson-1.12.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/apache/parquet/parquet-jackson/1.12.0/parquet-jackson-1.12.0.jar --slot 0 --keywords "~amd64" --ebuild parquet-jackson-1.12.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.parquet:parquet-jackson:1.12.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Parquet is a columnar storage format that supports nested data. This provides the java implementation."
HOMEPAGE="https://parquet.apache.org"
SRC_URI="https://repo1.maven.org/maven2/org/apache/parquet/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/parquet/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

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
