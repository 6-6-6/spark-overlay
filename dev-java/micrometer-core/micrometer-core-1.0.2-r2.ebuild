# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="io.micrometer:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Application monitoring instrumentation facade"
HOMEPAGE="https://github.com/micrometer-metrics/micrometer"
SRC_URI="
	https://repo1.maven.org/maven2/io/micrometer/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/io/micrometer/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/HdrHistogram-2.1.10:0
	>=dev-java/LatencyUtils-2.0.3:0
	>=dev-java/cache-api-1.0.0:0
	>=dev-java/caffeine-2.6.1:0
	>=dev-java/hazelcast-bin-3.8.9:0
	>=dev-java/hibernate-core-5.2.13:0
	>=dev-java/hystrix-core-1.5.12:0
	>=dev-java/jetty-server-9.4.8_p20171121:9
	>=dev-java/logback-classic-1.2.3:0
	>=dev-java/metrics-core-4.1.1:0
	>=dev-java/reactor-core-3.1.4:0
	>=dev-java/tomcat-embed-core-8.5.28:0
	>=dev-java/aspectj-1.9.5:0
	>=dev-java/ehcache-2.10.4:2
	>=dev-java/guava-29.0:0
	>=dev-java/jsr305-3.0.2:0
	>=dev-java/okhttp-4.7.2:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
