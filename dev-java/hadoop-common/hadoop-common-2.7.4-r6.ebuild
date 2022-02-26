# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.hadoop:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Apache Hadoop Common"
HOMEPAGE="https://hadoop.apache.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# common-version-info.properties in pre-built JAR contains time stamp, commit
# hash and source checksum, making generated JAR impossible to be consistent
RESTRICT="test"

CP_DEPEND="
	>=dev-java/avro-1.8.2:0
	>=dev-java/curator-client-2.7.1:0
	>=dev-java/curator-recipes-2.8.0:0
	>=dev-java/hadoop-annotations-2.7.4:0
	>=dev-java/hadoop-auth-2.7.4:0
	>=dev-java/htrace-core-3.1.0:0
	>=dev-java/jackson-core-asl-1.9.13:0
	>=dev-java/jackson-mapper-asl-1.9.13:0
	>=dev-java/jersey-core-1.9:1
	>=dev-java/jersey-json-1.9:1
	>=dev-java/jersey-server-1.9:1
	>=dev-java/jets3t-0.9.0:0
	>=dev-java/jetty-6.1.26:6
	>=dev-java/jetty-sslengine-6.1.26:6
	>=dev-java/jetty-util-6.1.26:6
	>=dev-java/xmlenc-0.52:0
	>=dev-java/zookeeper-3.4.6:0
	>=dev-java/commons-cli-1.3.1:1
	>=dev-java/commons-codec-1.7:0
	>=dev-java/commons-collections-3.2.2:0
	>=dev-java/commons-compress-1.10:0
	>=dev-java/commons-configuration-1.6:0
	>=dev-java/commons-httpclient-3.1:3
	>=dev-java/commons-io-2.4:1
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/commons-logging-1.2:0[log4j]
	>=dev-java/commons-math-3.2:3
	>=dev-java/commons-net-3.2:0
	>=dev-java/gson-2.8.7:2.6
	>=dev-java/guava-29.0:0
	>=dev-java/jsch-0.1.54:0
	>=dev-java/jsr305-3.0.1:0
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
		>=dev-java/ant-core-1.10.7:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
	>=dev-java/slf4j-log4j12-1.7.28:0
	java-virtuals/jsp-api:2.3
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="ant-core"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVADOC_ARGS="-source 8"

src_prepare() {
	eapply "${FILESDIR}/${P}-Enums.valueOfFunction-deprecation.patch"
	eapply "${FILESDIR}/${P}-IOException-never-thrown.patch"
	eapply "${FILESDIR}/${P}-Objects.toStringHelper-deprecation.patch"
	eapply "${FILESDIR}/${P}-Migrate-to-log4j-12-api.patch"
	ver_test "$(java-config -g PROVIDES_VERSION)" -ge 9 && \
		eapply "${FILESDIR}/${P}-Migrate-Cleaner-for-Java-9+.patch"
	java-pkg-2_src_prepare
}

src_install() {
	java-pkg-simple_src_install
	java-pkg_register-dependency slf4j-log4j12,jsp-api-2.3
}
