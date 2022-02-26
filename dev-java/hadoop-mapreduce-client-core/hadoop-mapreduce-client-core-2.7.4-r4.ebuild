# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.hadoop:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Apache Hadoop MapReduce Client Core"
HOMEPAGE="https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Minor method signature incompatibilities that fail japi-compliance-checker
RESTRICT="test"

# Put dev-java/log4j-12-api:2 first so it has a higher priority if any other
# dependencies cause dev-java/log4j:0 to be present in the classpath, since
# java-pkg-simple.eclass traverses the dependency tree using BFS to generate
# the classpath as of February 2022.
#
# Note: This relies on an undocumented implementation detail of
# java-pkg-simple.eclass!
#
# More information: https://bugs.gentoo.org/804594#c5
CP_DEPEND="
	dev-java/log4j-12-api:2
	>=dev-java/avro-1.8.2:0
	>=dev-java/hadoop-annotations-2.7.4:0
	>=dev-java/hadoop-yarn-common-2.7.4:0
	>=dev-java/netty-3.7.0:0
	>=dev-java/guice-4.1:4
	>=dev-java/protobuf-java-3.11.4:0
	>=dev-java/slf4j-api-1.7.28:0
	>=dev-java/slf4j-log4j12-1.7.28:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
		>=dev-java/hadoop-common-2.7.4:0
		>=dev-java/commons-cli-1.3.1:1
		>=dev-java/commons-codec-1.7:0
		>=dev-java/commons-collections-3.2.2:0
		>=dev-java/commons-lang-2.6:2.1
		>=dev-java/commons-logging-1.2:0
		>=dev-java/guava-29.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="guava,commons-cli-1,commons-codec,commons-collections,commons-lang-2.1,commons-logging,hadoop-common"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_prepare() {
	eapply "${FILESDIR}/${P}-switch-Futures.addCallback-overload.patch"
	eapply "${FILESDIR}/${P}-migrate-to-log4j-12-api.patch"

	java-pkg-2_src_prepare
}
