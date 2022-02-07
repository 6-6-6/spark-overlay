# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.spark:spark-kvstore_2.12:3.0.0-preview2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Spark Project Local DB"
HOMEPAGE="https://spark.apache.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/spark/${PN}_2.12/${PV}-preview2/${PN}_2.12-${PV}-preview2-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/spark/${PN}_2.12/${PV}-preview2/${PN}_2.12-${PV}-preview2.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="2.12"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/jackson-databind-2.10.0:0
	>=dev-java/spark-tags-3.0.0:2.12
	>=dev-java/unused-1.0.0:0
	>=dev-java/jackson-core-2.11.0:0
	>=dev-java/jackson-annotations-2.11.0:2
	>=dev-java/leveldbjni-1.8:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
		>=dev-java/guava-29.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="guava"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
