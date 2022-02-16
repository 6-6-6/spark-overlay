# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.hazelcast:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Core Hazelcast Module"
HOMEPAGE="https://www.hazelcast.com/"
SRC_URI="
	https://repo1.maven.org/maven2/com/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Compilation requires a class called AtomicLongGetAndAlterCodec, but no source
# file could be found for the class
IUSE="+binary"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		>=dev-java/cache-api-1.0.0:0
		>=dev-java/groovy-all-2.4.0:0
		>=dev-java/jruby-complete-1.7.22:0
		dev-java/log4j-12-api:2
		>=dev-java/log4j-api-2.3:2
		>=dev-java/log4j-core-2.3:2
		>=dev-java/findbugs-annotations-3.0.12:3
		>=dev-java/osgi-core-api-5.0.0:0
		>=dev-java/slf4j-api-1.7.7:0
		dev-java/hazelcast-code-generator:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="findbugs-annotations-3,cache-api,log4j-12-api-2,log4j-api-2,log4j-core-2,groovy-all,jruby-complete,osgi-core-api,slf4j-api,hazelcast-code-generator"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
