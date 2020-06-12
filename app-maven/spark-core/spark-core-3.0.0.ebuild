# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/spark-core_2.12-3.0.0-preview2.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/spark/spark-core_2.12/3.0.0-preview2/spark-core_2.12-3.0.0-preview2-sources.jar --slot 2.12 --keywords "~amd64" --ebuild spark-core-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Apache Software Foundation provides support for the Apache community of open-source software projects.
    The Apache projects are characterized by a collaborative, consensus based development process, an open and
    pragmatic software license, and a desire to create high quality software that leads the way in its field.
    We consider ourselves not simply a group of projects sharing a server, but rather a community of developers
    and users."
HOMEPAGE="http://spark.apache.org/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/spark/${PN}_2.12/${PV}-preview2/${PN}_2.12-${PV}-preview2-sources.jar"
LICENSE=""
SLOT="2.12"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.spark:spark-core_2.12:3.0.0-preview2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}-preview2.pom
# com.clearspring.analytics:stream:2.9.6 -> >=app-maven/stream-2.9.8:0
# com.fasterxml.jackson.core:jackson-databind:2.10.0 -> >=dev-java/jackson-databind-2.11.0:0
# com.fasterxml.jackson.module:jackson-module-scala_2.12:2.10.0 -> >=app-maven/jackson-module-scala-2.11.0:2.12
# com.github.luben:zstd-jni:1.4.4-3 -> >=app-maven/zstd-jni-1.4.5.4:0
# com.google.code.findbugs:jsr305:3.0.0 -> >=dev-java/jsr305-3.0.1:0
# com.ning:compress-lzf:1.0.3 -> >=app-maven/compress-lzf-1.0.4:0
# com.twitter:chill-java:0.9.3 -> >=app-maven/chill-java-0.9.5:0
# com.twitter:chill_2.12:0.9.3 -> >=app-maven/chill-0.9.5:2.12
# commons-net:commons-net:3.1 -> >=dev-java/commons-net-3.6:0
# io.dropwizard.metrics:metrics-core:4.1.1 -> >=app-maven/metrics-core-4.1.9:0
# io.dropwizard.metrics:metrics-graphite:4.1.1 -> >=app-maven/metrics-graphite-4.1.9:0
# io.dropwizard.metrics:metrics-jmx:4.1.1 -> >=app-maven/metrics-jmx-4.1.9:0
# io.dropwizard.metrics:metrics-json:4.1.1 -> >=app-maven/metrics-json-4.1.9:0
# io.dropwizard.metrics:metrics-jvm:4.1.1 -> >=app-maven/metrics-jvm-4.1.9:0
# io.netty:netty-all:4.1.42.Final -> >=app-maven/netty-all-5.0.0:0
# javax.activation:activation:1.1.1 -> >=app-maven/activation-1.1.1:0
# javax.servlet:javax.servlet-api:3.1.0 -> >=java-virtuals/servlet-api-2.3:2.3
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# net.razorvine:pyrolite:4.30 -> >=app-maven/pyrolite-5.0:0
# net.sf.py4j:py4j:0.10.8.1 -> >=app-maven/py4j-0.10.9:0
# org.apache.avro:avro:1.8.2 -> >=app-maven/avro-1.9.2:0
# org.apache.avro:avro-mapred:1.8.2 -> >=app-maven/avro-mapred-1.9.2:0
# org.apache.commons:commons-crypto:1.0.0 -> >=dev-java/commons-crypto-1.0.0:0
# org.apache.commons:commons-lang3:3.9 -> >=dev-java/commons-lang-3.10:3
# org.apache.commons:commons-math3:3.4.1 -> >=dev-java/commons-math-3.6.1:3
# org.apache.commons:commons-text:1.6 -> >=dev-java/commons-text-1.8:0
# org.apache.curator:curator-recipes:2.7.1 -> >=app-maven/curator-recipes-5.0.0:0
# org.apache.hadoop:hadoop-client:2.7.4 -> >=app-maven/hadoop-client-3.2.1:0
# org.apache.ivy:ivy:2.4.0 -> >=dev-java/ant-ivy-1.4.1:0
# org.apache.spark:spark-kvstore_2.12:3.0.0-preview2 -> >=app-maven/spark-kvstore-3.0.0:2.12
# org.apache.spark:spark-launcher_2.12:3.0.0-preview2 -> >=app-maven/spark-launcher-3.0.0:2.12
# org.apache.spark:spark-network-common_2.12:3.0.0-preview2 -> >=app-maven/spark-network-common-3.0.0:2.12
# org.apache.spark:spark-network-shuffle_2.12:3.0.0-preview2 -> >=app-maven/spark-network-shuffle-3.0.0:2.12
# org.apache.spark:spark-tags_2.12:3.0.0-preview2 -> >=app-maven/spark-tags-3.0.0:2.12
# org.apache.spark:spark-unsafe_2.12:3.0.0-preview2 -> >=app-maven/spark-unsafe-3.0.0:2.12
# org.apache.xbean:xbean-asm7-shaded:4.15 -> >=app-maven/xbean-asm7-shaded-4.16:0
# org.apache.zookeeper:zookeeper:3.4.14 -> >=app-maven/zookeeper-3.6.1:0
# org.glassfish.jersey.containers:jersey-container-servlet:2.29.1 -> >=app-maven/jersey-container-servlet-3.0.0:0
# org.glassfish.jersey.containers:jersey-container-servlet-core:2.29.1 -> >=app-maven/jersey-container-servlet-core-3.0.0:0
# org.glassfish.jersey.core:jersey-client:2.29.1 -> >=app-maven/jersey-client-3.0.0:0
# org.glassfish.jersey.core:jersey-common:2.29.1 -> >=app-maven/jersey-common-3.0.0:0
# org.glassfish.jersey.core:jersey-server:2.29.1 -> >=app-maven/jersey-server-3.0.0:0
# org.glassfish.jersey.inject:jersey-hk2:2.29.1 -> >=app-maven/jersey-hk2-3.0.0:0
# org.json4s:json4s-jackson_2.12:3.6.6 -> >=app-maven/json4s-jackson-3.7.0:2.12
# org.lz4:lz4-java:1.7.0 -> >=app-maven/lz4-java-1.7.1:0
# org.roaringbitmap:RoaringBitmap:0.7.45 -> >=dev-java/RoaringBitmap-0.8.18:0.8.18
# org.scala-lang:scala-library:2.12.10 -> >=app-maven/scala-library-2.13.2:0
# org.scala-lang:scala-reflect:2.12.10 -> >=app-maven/scala-reflect-2.13.2:0
# org.scala-lang.modules:scala-xml_2.12:1.2.0 -> >=app-maven/scala-xml-2.0.0:2.12
# org.slf4j:jcl-over-slf4j:1.7.16 -> >=dev-java/slf4j-api-1.7.7:0
# org.slf4j:jul-to-slf4j:1.7.16 -> >=dev-java/slf4j-api-1.7.7:0
# org.slf4j:slf4j-api:1.7.16 -> >=dev-java/slf4j-api-1.7.7:0
# org.slf4j:slf4j-log4j12:1.7.16 -> >=dev-java/slf4j-api-1.7.7:0
# org.spark-project.spark:unused:1.0.0 -> >=app-maven/unused-1.0.0:0
# org.xerial.snappy:snappy-java:1.1.7.3 -> >=dev-java/snappy-1.0.3_rc3:1.0
# oro:oro:2.0.8 -> >=app-maven/oro-2.0.8:0

CDEPEND="
	>=app-maven/activation-1.1.1:0
	>=app-maven/avro-1.9.2:0
	>=app-maven/avro-mapred-1.9.2:0
	>=app-maven/chill-0.9.5:2.12
	>=app-maven/chill-java-0.9.5:0
	>=app-maven/compress-lzf-1.0.4:0
	>=app-maven/curator-recipes-5.0.0:0
	>=app-maven/hadoop-client-3.2.1:0
	>=app-maven/jackson-module-scala-2.11.0:2.12
	>=app-maven/jersey-client-3.0.0:0
	>=app-maven/jersey-common-3.0.0:0
	>=app-maven/jersey-container-servlet-3.0.0:0
	>=app-maven/jersey-container-servlet-core-3.0.0:0
	>=app-maven/jersey-hk2-3.0.0:0
	>=app-maven/jersey-server-3.0.0:0
	>=app-maven/json4s-jackson-3.7.0:2.12
	>=app-maven/lz4-java-1.7.1:0
	>=app-maven/metrics-core-4.1.9:0
	>=app-maven/metrics-graphite-4.1.9:0
	>=app-maven/metrics-jmx-4.1.9:0
	>=app-maven/metrics-json-4.1.9:0
	>=app-maven/metrics-jvm-4.1.9:0
	>=app-maven/netty-all-5.0.0:0
	>=app-maven/oro-2.0.8:0
	>=app-maven/py4j-0.10.9:0
	>=app-maven/pyrolite-5.0:0
	>=app-maven/scala-library-2.13.2:0
	>=app-maven/scala-reflect-2.13.2:0
	>=app-maven/scala-xml-2.0.0:2.12
	>=app-maven/spark-kvstore-3.0.0:2.12
	>=app-maven/spark-launcher-3.0.0:2.12
	>=app-maven/spark-network-common-3.0.0:2.12
	>=app-maven/spark-network-shuffle-3.0.0:2.12
	>=app-maven/spark-tags-3.0.0:2.12
	>=app-maven/spark-unsafe-3.0.0:2.12
	>=app-maven/stream-2.9.8:0
	>=app-maven/unused-1.0.0:0
	>=app-maven/xbean-asm7-shaded-4.16:0
	>=app-maven/zookeeper-3.6.1:0
	>=app-maven/zstd-jni-1.4.5.4:0
	>=dev-java/RoaringBitmap-0.8.18:0.8.18
	>=dev-java/ant-ivy-1.4.1:0
	>=dev-java/commons-crypto-1.0.0:0
	>=dev-java/commons-lang-3.10:3
	>=dev-java/commons-math-3.6.1:3
	>=dev-java/commons-net-3.6:0
	>=dev-java/commons-text-1.8:0
	>=dev-java/jackson-databind-2.11.0:0
	>=dev-java/jsr305-3.0.1:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/slf4j-api-1.7.7:0
	>=dev-java/snappy-1.0.3_rc3:1.0
	>=java-virtuals/servlet-api-2.3:2.3
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}-preview2.pom
# com.google.guava:guava:14.0.1 -> >=dev-java/guava-20.0:20

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=dev-java/guava-20.0:20
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}-preview2.pom
# com.thoughtworks.paranamer:paranamer:2.8 -> >=app-maven/paranamer-2.8:0
RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}
	>=app-maven/paranamer-2.8:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="stream,jackson-databind,jackson-module-scala-2.12,zstd-jni,jsr305,compress-lzf,chill-java,chill-2.12,commons-net,metrics-core,metrics-graphite,metrics-jmx,metrics-json,metrics-jvm,netty-all,activation,servlet-api-2.3,log4j,pyrolite,py4j,avro,avro-mapred,commons-crypto,commons-lang-3,commons-math-3,commons-text,curator-recipes,hadoop-client,ant-ivy,spark-kvstore-2.12,spark-launcher-2.12,spark-network-common-2.12,spark-network-shuffle-2.12,spark-tags-2.12,spark-unsafe-2.12,xbean-asm7-shaded,zookeeper,jersey-container-servlet,jersey-container-servlet-core,jersey-client,jersey-common,jersey-server,jersey-hk2,json4s-jackson-2.12,lz4-java,RoaringBitmap-0.8.18,scala-library,scala-reflect,scala-xml-2.12,slf4j-api,slf4j-api,slf4j-api,slf4j-api,unused,snappy-1.0,oro,paranamer"
JAVA_GENTOO_CLASSPATH_EXTRA="guava-20"
