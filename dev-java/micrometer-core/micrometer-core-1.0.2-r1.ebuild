# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/micrometer-core-1.0.2.pom --download-uri https://repo1.maven.org/maven2/io/micrometer/micrometer-core/1.0.2/micrometer-core-1.0.2-sources.jar --slot 0 --keywords "~amd64" --ebuild micrometer-core-1.0.2-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Application monitoring instrumentation facade"
HOMEPAGE="https://github.com/micrometer-metrics/micrometer"
SRC_URI="https://repo1.maven.org/maven2/io/micrometer/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/micrometer/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.micrometer:micrometer-core:1.0.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# ch.qos.logback:logback-classic:1.2.3 -> >=dev-java/logback-classic-1.2.3:0
# com.github.ben-manes.caffeine:caffeine:2.6.1 -> >=dev-java/caffeine-2.6.1:0
# com.google.code.findbugs:jsr305:3.0.2 -> >=dev-java/jsr305-3.0.2:0
# com.google.guava:guava:23.0 -> >=dev-java/guava-29.0:0
# com.hazelcast:hazelcast:3.8.9 -> >=dev-java/hazelcast-3.8.9:0
# com.netflix.hystrix:hystrix-core:1.5.12 -> >=dev-java/hystrix-core-1.5.12:0
# com.squareup.okhttp3:okhttp:3.9.1 -> >=dev-java/okhttp-4.7.2:0
# io.dropwizard.metrics:metrics-core:3.2.6 -> >=dev-java/metrics-core-4.1.1:0
# io.projectreactor:reactor-core:3.1.4.RELEASE -> >=dev-java/reactor-core-3.1.4:0
# javax.cache:cache-api:1.0.0 -> >=dev-java/cache-api-1.0.0:0
# net.sf.ehcache:ehcache:2.10.4 -> >=dev-java/ehcache-2.10.4:0
# org.apache.tomcat.embed:tomcat-embed-core:8.5.28 -> >=dev-java/tomcat-embed-core-8.5.28:0
# org.aspectj:aspectjweaver:1.8.13 -> >=dev-java/aspectj-1.9.5:0
# org.eclipse.jetty:jetty-server:9.4.8.v20171121 -> >=dev-java/jetty-server-9.4.8_p20171121:9
# org.hdrhistogram:HdrHistogram:2.1.10 -> >=dev-java/HdrHistogram-2.1.10:0
# org.hibernate:hibernate-entitymanager:5.2.13.Final -> >=dev-java/hibernate-entitymanager-5.2.13:0
# org.latencyutils:LatencyUtils:2.0.3 -> >=dev-java/LatencyUtils-2.0.3:0

CDEPEND="
	>=dev-java/HdrHistogram-2.1.10:0
	>=dev-java/LatencyUtils-2.0.3:0
	>=dev-java/cache-api-1.0.0:0
	>=dev-java/caffeine-2.6.1:0
	>=dev-java/hazelcast-3.8.9:0
	>=dev-java/hibernate-entitymanager-5.2.13:0
	>=dev-java/hystrix-core-1.5.12:0
	>=dev-java/jetty-server-9.4.8_p20171121:9
	>=dev-java/logback-classic-1.2.3:0
	>=dev-java/metrics-core-4.1.1:0
	>=dev-java/reactor-core-3.1.4:0
	>=dev-java/tomcat-embed-core-8.5.28:0
	>=dev-java/aspectj-1.9.5:0
	>=dev-java/ehcache-2.10.4:0
	>=dev-java/guava-29.0:0
	>=dev-java/jsr305-3.0.2:0
	>=dev-java/okhttp-4.7.2:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="logback-classic,caffeine,jsr305,guava,hazelcast,hystrix-core,okhttp,metrics-core,reactor-core,cache-api,ehcache,tomcat-embed-core,aspectj,jetty-server-9,HdrHistogram,hibernate-entitymanager,LatencyUtils"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

