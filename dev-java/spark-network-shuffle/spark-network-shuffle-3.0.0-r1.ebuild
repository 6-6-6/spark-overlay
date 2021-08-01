# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/spark-network-shuffle_2.12-3.0.0-preview2.pom --download-uri https://repo1.maven.org/maven2/org/apache/spark/spark-network-shuffle_2.12/3.0.0-preview2/spark-network-shuffle_2.12-3.0.0-preview2-sources.jar --slot 2.12 --keywords "~amd64" --ebuild spark-network-shuffle-3.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.spark:spark-network-shuffle_2.12:3.0.0-preview2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Spark Project Shuffle Streaming Service"
HOMEPAGE="https://spark.apache.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/spark/${PN}_2.12/${PV}-preview2/${PN}_2.12-${PV}-preview2-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/spark/${PN}_2.12/${PV}-preview2/${PN}_2.12-${PV}-preview2.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="2.12"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}-preview2.pom
# io.dropwizard.metrics:metrics-core:4.1.1 -> >=dev-java/metrics-core-4.1.1:0
# org.apache.spark:spark-network-common_2.12:3.0.0-preview2 -> >=dev-java/spark-network-common-3.0.0:2.12
# org.spark-project.spark:unused:1.0.0 -> >=dev-java/unused-1.0.0:0

CDEPEND="
	>=dev-java/metrics-core-4.1.1:0
	>=dev-java/spark-network-common-3.0.0:2.12
	>=dev-java/unused-1.0.0:0
"

BDEPEND="
	app-arch/unzip
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}-preview2.pom
# com.google.guava:guava:14.0.1 -> >=dev-java/guava-29.0:0
# org.slf4j:slf4j-api:1.7.16 -> >=dev-java/slf4j-api-1.7.28:0

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CDEPEND}
		>=dev-java/guava-29.0:0
		>=dev-java/slf4j-api-1.7.28:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="metrics-core,spark-network-common-2.12,unused"
JAVA_CLASSPATH_EXTRA="guava,slf4j-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_prepare() {
	if ! use binary; then
		eapply "${FILESDIR}/${P}-Objects.toStringHelper-removal.patch"
	fi

	eapply_user
}
