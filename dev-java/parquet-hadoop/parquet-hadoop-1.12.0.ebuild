# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/parquet-hadoop-1.12.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/apache/parquet/parquet-hadoop/1.12.0/parquet-hadoop-1.12.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/apache/parquet/parquet-hadoop/1.12.0/parquet-hadoop-1.12.0.jar --slot 0 --keywords "~amd64" --ebuild parquet-hadoop-1.12.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.parquet:parquet-hadoop:1.12.0"
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
# com.github.luben:zstd-jni:1.4.9-1 -> >=dev-java/zstd-jni-1.4.9.1:0
# com.github.rdblue:brotli-codec:0.1.1 -> >=dev-java/brotli-codec-0.1.1:0
# commons-pool:commons-pool:1.6 -> >=dev-java/commons-pool-1.6:0
# org.apache.parquet:parquet-column:1.12.0 -> >=dev-java/parquet-column-1.12.0:0
# org.apache.parquet:parquet-format-structures:1.12.0 -> >=dev-java/parquet-format-structures-1.12.0:0
# org.apache.parquet:parquet-jackson:1.12.0 -> >=dev-java/parquet-jackson-1.12.0:0
# org.xerial.snappy:snappy-java:1.1.8 -> >=dev-java/snappy-java-1.1.8:0

CDEPEND="
	>=dev-java/brotli-codec-0.1.1:0
	>=dev-java/commons-pool-1.6:0
	>=dev-java/parquet-column-1.12.0:0
	>=dev-java/parquet-format-structures-1.12.0:0
	>=dev-java/parquet-jackson-1.12.0:0
	>=dev-java/snappy-java-1.1.8:0
	>=dev-java/zstd-jni-1.4.9.1:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-client:2.10.1 -> >=dev-java/hadoop-client-2.10.1:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/hadoop-client-2.10.1:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="zstd-jni,brotli-codec,commons-pool,parquet-column,parquet-format-structures,parquet-jackson,snappy-java"
JAVA_CLASSPATH_EXTRA="hadoop-client"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
