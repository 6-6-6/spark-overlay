# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/spark-network-common_2.12-3.0.0-preview2.pom --download-uri https://repo1.maven.org/maven2/org/apache/spark/spark-network-common_2.12/3.0.0-preview2/spark-network-common_2.12-3.0.0-preview2-sources.jar --slot 2.12 --keywords "~amd64" --ebuild spark-network-common-3.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.spark:spark-network-common_2.12:3.0.0-preview2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Spark Project Networking"
HOMEPAGE="https://spark.apache.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/spark/${PN}_2.12/${PV}-preview2/${PN}_2.12-${PV}-preview2-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/spark/${PN}_2.12/${PV}-preview2/${PN}_2.12-${PV}-preview2.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="2.12"
KEYWORDS="~amd64"

# This package can be compiled from source, but doing so would cause a runtime
# error when Spark is run
IUSE="+binary"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}-preview2.pom
# com.fasterxml.jackson.core:jackson-annotations:2.10.0 -> >=dev-java/jackson-annotations-2.11.0:2
# com.fasterxml.jackson.core:jackson-databind:2.10.0 -> >=dev-java/jackson-databind-2.10.0:0
# com.google.code.findbugs:jsr305:3.0.0 -> >=dev-java/jsr305-3.0.1:0
# io.dropwizard.metrics:metrics-core:4.1.1 -> >=dev-java/metrics-core-4.1.1:0
# io.netty:netty-all:4.1.42.Final -> >=dev-java/netty-all-5.0.0:0
# org.apache.commons:commons-crypto:1.0.0 -> >=dev-java/commons-crypto-1.0.0:0
# org.apache.commons:commons-lang3:3.9 -> >=dev-java/commons-lang-3.12.0:3.6
# org.fusesource.leveldbjni:leveldbjni-all:1.8 -> >=dev-java/leveldbjni-1.8:0
# org.scala-lang:scala-library:2.12.10 -> >=dev-java/scala-common-bin-2.12.4:2.12
# org.spark-project.spark:unused:1.0.0 -> >=dev-java/unused-1.0.0:0

CDEPEND="
	>=dev-java/jackson-databind-2.10.0:0
	>=dev-java/metrics-core-4.1.1:0
	>=dev-java/unused-1.0.0:0
	>=dev-java/commons-crypto-1.0.0:0
	>=dev-java/commons-lang-3.12.0:3.6
	>=dev-java/jackson-annotations-2.11.0:2
	>=dev-java/jsr305-3.0.1:0
	>=dev-java/leveldbjni-1.8:0
	>=dev-java/netty-all-4.1.42:0
	>=dev-java/scala-common-bin-2.12.4:2.12
	dev-java/scala-xml:2.12
"

BDEPEND="
	app-arch/unzip
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}-preview2.pom
# org.slf4j:slf4j-api:1.7.16 -> >=dev-java/slf4j-api-1.7.28:0

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CDEPEND}
		>=dev-java/slf4j-api-1.7.28:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-annotations-2,jackson-databind,jsr305,metrics-core,netty-all,commons-crypto,commons-lang-3.6,leveldbjni,scala-common-bin-2.12,unused,scala-xml-2.12"
JAVA_CLASSPATH_EXTRA="slf4j-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
