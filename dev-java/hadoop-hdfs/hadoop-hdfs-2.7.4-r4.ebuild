# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.hadoop:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Apache Hadoop HDFS"
HOMEPAGE="https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/HdfsDesign.html"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/htrace-core-3.1.0:0
	>=dev-java/jackson-core-asl-1.9.13:0
	>=dev-java/jackson-mapper-asl-1.9.13:0
	>=dev-java/jersey-core-1.9:1
	>=dev-java/jersey-server-1.9:1
	>=dev-java/jetty-6.1.26:6
	>=dev-java/jetty-util-6.1.26:6
	>=dev-java/netty-3.7.0:0
	>=dev-java/xmlenc-0.52:0
	>=dev-java/commons-cli-1.3.1:1
	>=dev-java/commons-codec-1.7:0
	>=dev-java/commons-daemon-1.0.15:0
	>=dev-java/commons-io-2.4:1
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/commons-logging-1.2:0
	>=dev-java/guava-29.0:0
	>=dev-java/leveldbjni-1.8:0
	>=dev-java/log4j-12-api-2.18.0:2
	>=dev-java/netty-all-4.0.24:0
	>=dev-java/protobuf-java-3.11.4:0
	>=dev-java/xerces-2.12.0:2
	java-virtuals/servlet-api:4.0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
		>=dev-java/hadoop-annotations-2.7.4:0
		>=dev-java/hadoop-auth-2.7.4:0
		>=dev-java/hadoop-common-2.7.4:0
		>=dev-java/slf4j-log4j12-1.7.28:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="hadoop-annotations,hadoop-auth,hadoop-common,slf4j-log4j12"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_prepare() {
	eapply "${FILESDIR}/${P}-Guava-removed-methods.patch"
	eapply "${FILESDIR}/${P}-switch-Futures.addCallback-overload.patch"
	eapply "${FILESDIR}/${P}-migrate-to-log4j-12-api-2.18+.patch"

	java-pkg-2_src_prepare
}

src_compile() {
	java-pkg-simple_src_compile
	use binary && return

	# Add files included in the upstream's pre-built JAR
	pushd "${JAVA_SRC_DIR}" > /dev/null || die "Failed to enter JAVA_SRC_DIR"
	jar uf "${S}/${JAVA_JAR_FILENAME}" hdfs-default.xml ||
		die "Failed to add additional files to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
}
