# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/spark-core_2.12-3.0.0-preview2.pom --download-uri https://repo1.maven.org/maven2/org/apache/spark/spark-core_2.12/3.0.0-preview2/spark-core_2.12-3.0.0-preview2-sources.jar --slot 2.12 --keywords "~amd64" --ebuild spark-core-3.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.spark:spark-core_2.12:3.0.0-preview2"

inherit java-pkg-2 java-pkg-simple java-pkg-maven java-pkg-simple-plugins

DESCRIPTION="The Apache Software Foundation provides support for the Apache community of open-source software projects. The Apache projects are characterized by a collaborative, consensus based development process, an open and pragmatic software license, and a desire to create high quality software that leads the way in its field. We consider ourselves not simply a group of projects sharing a server, but rather a community of developers and users."
HOMEPAGE="http://spark.apache.org/"
SRC_URI="https://repo1.maven.org/maven2/org/apache/spark/${PN}_2.12/${PV}-preview2/${PN}_2.12-${PV}-preview2-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/spark/${PN}_2.12/${PV}-preview2/${PN}_2.12-${PV}-preview2.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="2.12"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}-preview2.pom
# com.clearspring.analytics:stream:2.9.6 -> >=dev-java/stream-2.9.8:0
# com.fasterxml.jackson.core:jackson-databind:2.10.0 -> >=dev-java/jackson-databind-2.10.0:0
# com.fasterxml.jackson.module:jackson-module-scala_2.12:2.10.0 -> >=dev-java/jackson-module-scala-2.10.0:2.12
# com.github.luben:zstd-jni:1.4.4-3 -> >=dev-java/zstd-jni-1.4.4.7:0
# com.google.code.findbugs:jsr305:3.0.0 -> >=dev-java/jsr305-3.0.1:0
# com.ning:compress-lzf:1.0.3 -> >=dev-java/compress-lzf-1.0.3:0
# com.twitter:chill-java:0.9.3 -> >=dev-java/chill-java-0.9.3:0
# com.twitter:chill_2.12:0.9.3 -> >=dev-java/chill-0.9.3:2.12
# commons-net:commons-net:3.1 -> >=dev-java/commons-net-3.2:0
# io.dropwizard.metrics:metrics-core:4.1.1 -> >=dev-java/metrics-core-4.1.1:0
# io.dropwizard.metrics:metrics-graphite:4.1.1 -> >=dev-java/metrics-graphite-4.1.1:0
# io.dropwizard.metrics:metrics-jmx:4.1.1 -> >=dev-java/metrics-jmx-4.1.1:0
# io.dropwizard.metrics:metrics-json:4.1.1 -> >=dev-java/metrics-json-4.1.1:0
# io.dropwizard.metrics:metrics-jvm:4.1.1 -> >=dev-java/metrics-jvm-4.1.1:0
# io.netty:netty-all:4.1.42.Final -> >=dev-java/netty-all-5.0.0:0
# javax.activation:activation:1.1.1 -> >=dev-java/activation-1.1.1:0
# javax.servlet:javax.servlet-api:3.1.0 -> java-virtuals/servlet-api:4.0
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# net.razorvine:pyrolite:4.30 -> >=dev-java/pyrolite-4.30:0
# net.sf.py4j:py4j:0.10.8.1 -> >=dev-java/py4j-0.10.8.1:0
# org.apache.avro:avro:1.8.2 -> >=dev-java/avro-1.8.2:0
# org.apache.avro:avro-mapred:1.8.2 -> >=dev-java/avro-mapred-1.8.2:0
# org.apache.commons:commons-crypto:1.0.0 -> >=dev-java/commons-crypto-1.0.0:0
# org.apache.commons:commons-lang3:3.9 -> >=dev-java/commons-lang-3.10:3.10
# org.apache.commons:commons-math3:3.4.1 -> >=dev-java/commons-math-3.6.1:0
# org.apache.commons:commons-text:1.6 -> >=dev-java/commons-text-1.6:0
# org.apache.curator:curator-recipes:2.7.1 -> >=dev-java/curator-recipes-2.8.0:0
# org.apache.hadoop:hadoop-client:2.7.4 -> >=dev-java/hadoop-client-2.7.4:0
# org.apache.ivy:ivy:2.4.0 -> >=dev-java/ant-ivy-2.4.0:2
# org.apache.spark:spark-kvstore_2.12:3.0.0-preview2 -> >=dev-java/spark-kvstore-3.0.0:2.12
# org.apache.spark:spark-launcher_2.12:3.0.0-preview2 -> >=dev-java/spark-launcher-3.0.0:2.12
# org.apache.spark:spark-network-common_2.12:3.0.0-preview2 -> >=dev-java/spark-network-common-3.0.0:2.12
# org.apache.spark:spark-network-shuffle_2.12:3.0.0-preview2 -> >=dev-java/spark-network-shuffle-3.0.0:2.12
# org.apache.spark:spark-tags_2.12:3.0.0-preview2 -> >=dev-java/spark-tags-3.0.0:2.12
# org.apache.spark:spark-unsafe_2.12:3.0.0-preview2 -> >=dev-java/spark-unsafe-3.0.0:2.12
# org.apache.xbean:xbean-asm7-shaded:4.15 -> >=dev-java/xbean-asm7-shaded-4.15:0
# org.apache.zookeeper:zookeeper:3.4.14 -> >=dev-java/zookeeper-3.4.14:0
# org.glassfish.jersey.containers:jersey-container-servlet:2.29.1 -> >=dev-java/jersey-container-servlet-2.29.1:2
# org.glassfish.jersey.containers:jersey-container-servlet-core:2.29.1 -> >=dev-java/jersey-container-servlet-core-2.29.1:2
# org.glassfish.jersey.core:jersey-client:2.29.1 -> >=dev-java/jersey-client-2.29.1:2
# org.glassfish.jersey.core:jersey-common:2.29.1 -> >=dev-java/jersey-common-2.29.1:2
# org.glassfish.jersey.core:jersey-server:2.29.1 -> >=dev-java/jersey-server-2.29.1:2
# org.glassfish.jersey.inject:jersey-hk2:2.29.1 -> >=dev-java/jersey-hk2-2.29.1:2
# org.json4s:json4s-jackson_2.12:3.6.6 -> >=dev-java/json4s-jackson-3.6.6:2.12
# org.lz4:lz4-java:1.7.0 -> >=dev-java/lz4-java-1.7.0:0
# org.roaringbitmap:RoaringBitmap:0.7.45 -> >=dev-java/RoaringBitmap-0.7.45:0
# org.scala-lang:scala-library:2.12.10 -> >=dev-java/scala-common-bin-2.12.4:2.12
# org.scala-lang:scala-reflect:2.12.10 -> >=dev-java/scala-common-bin-2.12.4:2.12
# org.scala-lang.modules:scala-xml_2.12:1.2.0 -> >=dev-java/scala-common-bin-2.12.4:2.12
# org.slf4j:jcl-over-slf4j:1.7.16 -> >=dev-java/jcl-over-slf4j-1.7.16:0
# org.slf4j:jul-to-slf4j:1.7.16 -> >=dev-java/jul-to-slf4j-1.7.16:0
# org.slf4j:slf4j-api:1.7.16 -> >=dev-java/slf4j-api-1.7.28:0
# org.slf4j:slf4j-log4j12:1.7.16 -> >=dev-java/slf4j-log4j12-1.7.28:0
# org.spark-project.spark:unused:1.0.0 -> >=dev-java/unused-1.0.0:0
# org.xerial.snappy:snappy-java:1.1.7.3 -> >=dev-java/snappy-1.1.7.5:1.1
# oro:oro:2.0.8 -> >=dev-java/jakarta-oro-2.0.8:2.0

CDEPEND="
	>=dev-java/RoaringBitmap-0.7.45:0
	>=dev-java/activation-1.1.1:0
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
	>=dev-java/commons-lang-3.10:3.10
	>=dev-java/commons-math-3.4.1:3
	>=dev-java/commons-net-3.2:0
	>=dev-java/jakarta-oro-2.0.8:2.0
	>=dev-java/jsr305-3.0.1:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/netty-all-5.0.0:0
	>=dev-java/scala-common-bin-2.12.4:2.12
	>=dev-java/slf4j-api-1.7.28:0
	>=dev-java/slf4j-log4j12-1.7.28:0
	>=dev-java/snappy-1.1.7.5:1.1
	java-virtuals/servlet-api:4.0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}-preview2.pom
# com.google.guava:guava:14.0.1 -> >=dev-java/guava-29.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/guava-29.0:0
	)
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}-preview2.pom
# com.thoughtworks.paranamer:paranamer:2.8 -> >=dev-java/paranamer-2.8:0
RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}
	>=dev-java/paranamer-2.8:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="stream,jackson-databind,jackson-module-scala-2.12,zstd-jni,jsr305,compress-lzf,chill-java,chill-2.12,commons-net,metrics-core,metrics-graphite,metrics-jmx,metrics-json,metrics-jvm,netty-all,activation,servlet-api-4.0,log4j,pyrolite,py4j,avro,avro-mapred,commons-crypto,commons-lang-3.10,commons-math-3,commons-text,curator-recipes,hadoop-client,ant-ivy-2,spark-kvstore-2.12,spark-launcher-2.12,spark-network-common-2.12,spark-network-shuffle-2.12,spark-tags-2.12,spark-unsafe-2.12,xbean-asm7-shaded,zookeeper,jersey-container-servlet-2,jersey-container-servlet-core-2,jersey-client-2,jersey-common-2,jersey-server-2,jersey-hk2-2,json4s-jackson-2.12,lz4-java,RoaringBitmap,scala-common-bin-2.12,scala-common-bin-2.12,scala-common-bin-2.12,jcl-over-slf4j,jul-to-slf4j,slf4j-api,slf4j-log4j12,unused,snappy-1.1,jakarta-oro-2.0,paranamer"
JAVA_CLASSPATH_EXTRA="guava"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_compile() {
	java-pkg-simple-plugins_src_compile
}
