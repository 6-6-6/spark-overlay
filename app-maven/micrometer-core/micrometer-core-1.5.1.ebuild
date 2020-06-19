# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/micrometer-core-1.5.1.pom --download-uri https://repo.maven.apache.org/maven2/io/micrometer/micrometer-core/1.5.1/micrometer-core-1.5.1-sources.jar --slot 0 --keywords "~amd64" --ebuild micrometer-core-1.5.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Application monitoring instrumentation facade"
HOMEPAGE="https://github.com/micrometer-metrics/micrometer"
SRC_URI="https://repo.maven.apache.org/maven2/io/micrometer/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.micrometer:micrometer-core:1.5.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# ch.qos.logback:logback-classic:1.2.3 -> >=app-maven/logback-classic-1.3.0_alpha5:0
# com.github.ben-manes.caffeine:caffeine:2.8.2 -> >=app-maven/caffeine-2.8.4:0
# com.google.code.findbugs:jsr305:3.0.2 -> >=dev-java/jsr305-3.0.2:0
# com.google.guava:guava:29.0-jre -> >=dev-java/guava-29.0:0
# com.hazelcast:hazelcast:4.0.1 -> >=app-maven/hazelcast-4.0.1:0
# com.netflix.hystrix:hystrix-core:1.5.12 -> >=app-maven/hystrix-core-1.5.18:0
# com.squareup.okhttp3:okhttp:4.5.0 -> >=app-maven/okhttp-4.7.2:0
# io.dropwizard.metrics:metrics-core:4.0.7 -> >=app-maven/metrics-core-4.1.9:0
# io.projectreactor:reactor-core:3.3.5.RELEASE -> >=app-maven/reactor-core-3.3.6:0
# io.projectreactor.netty:reactor-netty:0.9.7.RELEASE -> >=app-maven/reactor-netty-0.9.7:0
# javax.cache:cache-api:1.1.1 -> >=app-maven/cache-api-1.1.1:0
# net.sf.ehcache:ehcache:2.10.6 -> >=dev-java/ehcache-2.10.6:0
# org.apache.httpcomponents:httpasyncclient:4.1.4 -> >=app-maven/httpasyncclient-4.1.4:0
# org.apache.httpcomponents:httpclient:4.5.12 -> !!!suitble-avenVersion-not-found!!!
# org.apache.kafka:kafka-clients:2.5.0 -> >=app-maven/kafka-clients-2.5.0:0
# org.apache.kafka:kafka-streams:2.5.0 -> >=app-maven/kafka-streams-2.5.0:0
# org.apache.logging.log4j:log4j-core:2.13.2 -> >=app-maven/log4j-core-2.13.3:0
# org.apache.tomcat.embed:tomcat-embed-core:8.5.54 -> >=app-maven/tomcat-embed-core-10.0.0:0
# org.aspectj:aspectjweaver:1.8.14 -> >=dev-java/aspectj-1.9.5:0
# org.eclipse.jetty:jetty-client:9.4.28.v20200408 -> >=app-maven/jetty-client-9.4.28_p20200408:0
# org.eclipse.jetty:jetty-server:9.4.28.v20200408 -> >=app-maven/jetty-server-9.4.28_p20200408:0
# org.hdrhistogram:HdrHistogram:2.1.12 -> >=app-maven/HdrHistogram-2.1.12:0
# org.hibernate:hibernate-entitymanager:6.0.0.Alpha5 -> >=dev-java/hibernate-core-6.0.0:0
# org.jooq:jooq:3.13.1 -> >=app-maven/jooq-3.13.2:0
# org.mongodb:mongo-java-driver:3.12.3 -> >=app-maven/mongo-java-driver-3.12.5:0

CDEPEND="
	!!!suitble-avenVersion-not-found!!!
	>=app-maven/HdrHistogram-2.1.12:0
	>=app-maven/cache-api-1.1.1:0
	>=app-maven/caffeine-2.8.4:0
	>=app-maven/hazelcast-4.0.1:0
	>=app-maven/httpasyncclient-4.1.4:0
	>=app-maven/hystrix-core-1.5.18:0
	>=app-maven/jetty-client-9.4.28_p20200408:0
	>=app-maven/jetty-server-9.4.28_p20200408:0
	>=app-maven/jooq-3.13.2:0
	>=app-maven/kafka-clients-2.5.0:0
	>=app-maven/kafka-streams-2.5.0:0
	>=app-maven/log4j-core-2.13.3:0
	>=app-maven/logback-classic-1.3.0_alpha5:0
	>=app-maven/metrics-core-4.1.9:0
	>=app-maven/mongo-java-driver-3.12.5:0
	>=app-maven/okhttp-4.7.2:0
	>=app-maven/reactor-core-3.3.6:0
	>=app-maven/reactor-netty-0.9.7:0
	>=app-maven/tomcat-embed-core-10.0.0:0
	>=dev-java/aspectj-1.9.5:0
	>=dev-java/ehcache-2.10.6:0
	>=dev-java/guava-29.0:0
	>=dev-java/hibernate-core-6.0.0:0
	>=dev-java/jsr305-3.0.2:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.latencyutils:LatencyUtils:2.0.3 -> >=app-maven/LatencyUtils-2.0.3:0
RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}
	>=app-maven/LatencyUtils-2.0.3:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="logback-classic,caffeine,jsr305,guava,hazelcast,hystrix-core,okhttp,metrics-core,reactor-core,reactor-netty,cache-api,ehcache,httpasyncclient,!!!suitble-avenVersion-not-found!!!,kafka-clients,kafka-streams,log4j-core,tomcat-embed-core,aspectj,jetty-client,jetty-server,HdrHistogram,hibernate-core,jooq,mongo-java-driver,LatencyUtils"
