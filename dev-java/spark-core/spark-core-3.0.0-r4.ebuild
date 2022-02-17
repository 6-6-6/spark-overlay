# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.spark:spark-core_2.12:3.0.0-preview2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven java-pkg-simple-plugins

DESCRIPTION="Unified analytics engine for large-scale data processing"
HOMEPAGE="https://spark.apache.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/spark/${PN}_2.12/${PV}-preview2/${PN}_2.12-${PV}-preview2-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/spark/${PN}_2.12/${PV}-preview2/${PN}_2.12-${PV}-preview2.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="2.12"
KEYWORDS="~amd64"

# Some Spark components in various org.apache.spark.* packages are yet to be
# added to this overlay
IUSE="+binary"

CP_DEPEND="
	>=dev-java/RoaringBitmap-0.7.45:0
	dev-java/jakarta-activation-api:1
	>=dev-java/avro-1.8.2:0
	>=dev-java/avro-mapred-1.8.2:0
	>=dev-java/chill-0.9.3:2.12
	>=dev-java/chill-java-0.9.3:0
	>=dev-java/commons-text-1.6:0
	>=dev-java/compress-lzf-1.0.3:0
	>=dev-java/curator-recipes-2.8.0:0
	>=dev-java/hadoop-client-2.7.4:0
	>=dev-java/jackson-databind-2.10.0:0
	>=dev-java/jackson-module-scala-2.10.0:2.12
	>=dev-java/jcl-over-slf4j-1.7.16:0
	>=dev-java/jersey-client-2.29.1:2
	>=dev-java/jersey-common-2.29.1:2
	>=dev-java/jersey-container-servlet-2.29.1:2
	>=dev-java/jersey-container-servlet-core-2.29.1:2
	>=dev-java/jersey-hk2-2.29.1:2
	>=dev-java/jersey-server-2.29.1:2
	>=dev-java/json4s-jackson-3.6.6:2.12
	>=dev-java/jul-to-slf4j-1.7.16:0
	>=dev-java/lz4-java-1.7.0:0
	>=dev-java/metrics-core-4.1.1:0
	>=dev-java/metrics-graphite-4.1.1:0
	>=dev-java/metrics-jmx-4.1.1:0
	>=dev-java/metrics-json-4.1.1:0
	>=dev-java/metrics-jvm-4.1.1:0
	>=dev-java/py4j-0.10.8.1:0
	>=dev-java/pyrolite-4.30:0
	>=dev-java/spark-kvstore-3.0.0:2.12
	>=dev-java/spark-launcher-3.0.0:2.12
	>=dev-java/spark-network-common-3.0.0:2.12
	>=dev-java/spark-network-shuffle-3.0.0:2.12
	>=dev-java/spark-tags-3.0.0:2.12
	>=dev-java/spark-unsafe-3.0.0:2.12
	>=dev-java/stream-2.9.8:0
	>=dev-java/unused-1.0.0:0
	>=dev-java/xbean-asm7-shaded-4.15:0
	>=dev-java/zookeeper-3.4.14:0
	>=dev-java/zstd-jni-1.4.4.7:0
	>=dev-java/ant-ivy-2.4.0:2
	>=dev-java/commons-crypto-1.0.0:0
	>=dev-java/commons-lang-3.12.0:3.6
	>=dev-java/commons-math-3.4.1:3
	>=dev-java/commons-net-3.2:0
	>=dev-java/jakarta-oro-2.0.8:2.0
	>=dev-java/jsr305-3.0.1:0
	dev-java/log4j-12-api:2
	>=dev-java/netty-all-4.1.42:0
	>=dev-java/scala-common-bin-2.12.4:2.12
	>=dev-java/slf4j-api-1.7.28:0
	>=dev-java/slf4j-log4j12-1.7.28:0
	>=dev-java/snappy-1.1.7.5:1.1
	java-virtuals/servlet-api:4.0
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
	>=dev-java/paranamer-2.8:0
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="guava"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_compile() {
	java-pkg-simple-plugins_src_compile
	# Needed to register classpath dependencies
	java-pkg-simple_src_compile
}

src_install() {
	java-pkg-simple_src_install
	java-pkg_register-dependency paranamer
}
