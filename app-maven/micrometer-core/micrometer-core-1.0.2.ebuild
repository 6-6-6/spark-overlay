# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/micrometer-core-1.0.2.pom --download-uri https://repo1.maven.org/maven2/io/micrometer/micrometer-core/1.0.2/micrometer-core-1.0.2-sources.jar --slot 0 --keywords "~amd64" --ebuild micrometer-core-1.0.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Application monitoring instrumentation facade"
HOMEPAGE="https://github.com/micrometer-metrics/micrometer"
SRC_URI="https://repo1.maven.org/maven2/io/micrometer/${PN}/${PV}/${P}-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/io/micrometer/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.micrometer:micrometer-core:1.0.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# ch.qos.logback:logback-classic:1.2.3 -> >=app-maven/logback-classic-1.2.3:0
# com.github.ben-manes.caffeine:caffeine:2.6.1 -> >=app-maven/caffeine-2.6.1:0
# com.google.code.findbugs:jsr305:3.0.2 -> >=dev-java/jsr305-3.0.2:0
# com.google.guava:guava:23.0 -> >=dev-java/guava-29.0:0
# com.hazelcast:hazelcast:3.8.9 -> >=app-maven/hazelcast-3.8.9:0
# com.netflix.hystrix:hystrix-core:1.5.12 -> >=app-maven/hystrix-core-1.5.12:0
# com.squareup.okhttp3:okhttp:3.9.1 -> >=dev-java/okhttp-4.7.2:0
# io.dropwizard.metrics:metrics-core:3.2.6 -> >=app-maven/metrics-core-4.1.1:0
# io.projectreactor:reactor-core:3.1.4.RELEASE -> >=app-maven/reactor-core-3.1.4:0
# javax.cache:cache-api:1.0.0 -> >=app-maven/cache-api-1.0.0:0
# net.sf.ehcache:ehcache:2.10.4 -> >=dev-java/ehcache-2.10.4:0
# org.apache.tomcat.embed:tomcat-embed-core:8.5.28 -> >=app-maven/tomcat-embed-core-8.5.28:0
# org.aspectj:aspectjweaver:1.8.13 -> >=dev-java/aspectj-1.9.5:0
# org.eclipse.jetty:jetty-server:9.4.8.v20171121 -> >=app-maven/jetty-server-9.4.8_p20171121:0
# org.hdrhistogram:HdrHistogram:2.1.10 -> >=app-maven/HdrHistogram-2.1.10:0
# org.hibernate:hibernate-entitymanager:5.2.13.Final -> >=app-maven/hibernate-entitymanager-5.2.13:0
# org.latencyutils:LatencyUtils:2.0.3 -> >=app-maven/LatencyUtils-2.0.3:0

CDEPEND="
	>=app-maven/HdrHistogram-2.1.10:0
	>=app-maven/LatencyUtils-2.0.3:0
	>=app-maven/cache-api-1.0.0:0
	>=app-maven/caffeine-2.6.1:0
	>=app-maven/hazelcast-3.8.9:0
	>=app-maven/hibernate-entitymanager-5.2.13:0
	>=app-maven/hystrix-core-1.5.12:0
	>=app-maven/jetty-server-9.4.8_p20171121:0
	>=app-maven/logback-classic-1.2.3:0
	>=app-maven/metrics-core-4.1.1:0
	>=app-maven/reactor-core-3.1.4:0
	>=app-maven/tomcat-embed-core-8.5.28:0
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

JAVA_GENTOO_CLASSPATH="logback-classic,caffeine,jsr305,guava,hazelcast,hystrix-core,okhttp,metrics-core,reactor-core,cache-api,ehcache,tomcat-embed-core,aspectj,jetty-server,HdrHistogram,hibernate-entitymanager,LatencyUtils"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
