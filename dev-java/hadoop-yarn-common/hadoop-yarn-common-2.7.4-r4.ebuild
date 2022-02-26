# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.hadoop:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Apache Hadoop YARN Common"
HOMEPAGE="https://hadoop.apache.org/docs/stable/hadoop-yarn/hadoop-yarn-site/YARN.html"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Upstream pre-built JAR contains lots of CSS, JavaScript, JPEG, PNG, and XML
# files, failing pkgdiff check
RESTRICT="test"

CP_DEPEND="
	>=dev-java/hadoop-annotations-2.7.4:0
	>=dev-java/hadoop-yarn-api-2.7.4:0
	>=dev-java/jackson-core-asl-1.9.13:0
	>=dev-java/jackson-jaxrs-1.9.13:0
	>=dev-java/jackson-mapper-asl-1.9.13:0
	>=dev-java/jackson-xc-1.9.13:0
	>=dev-java/jaxb-api-2.2.2:2
	>=dev-java/jersey-client-1.9:1
	>=dev-java/jersey-core-1.9:1
	>=dev-java/jersey-guice-1.9:1
	>=dev-java/jersey-json-1.9:1
	>=dev-java/jersey-server-1.9:1
	>=dev-java/jetty-util-6.1.26:6
	>=dev-java/commons-cli-1.3.1:1
	>=dev-java/commons-codec-1.7:0
	>=dev-java/commons-compress-1.10:0
	>=dev-java/commons-io-2.4:1
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/commons-logging-1.2:0
	>=dev-java/guava-29.0:0
	>=dev-java/guice-4.1:4
	dev-java/log4j-12-api:2
	>=dev-java/protobuf-java-3.11.4:0
	>=dev-java/slf4j-api-1.7.28:0
	java-virtuals/servlet-api:4.0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
		>=dev-java/hadoop-common-2.7.4:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="hadoop-common"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVADOC_ARGS="-source 8"

src_prepare() {
	eapply "${FILESDIR}/${P}-Guava-CharMatcher.patch"
	eapply "${FILESDIR}/${P}-RPCUtil-cast-Throwable.patch"
	eapply "${FILESDIR}/${P}-migrate-to-log4j-12-api.patch"

	java-pkg-2_src_prepare
}
