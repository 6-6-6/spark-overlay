# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.hadoop:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Apache Hadoop Auth - Java HTTP SPNEGO"
HOMEPAGE="https://hadoop.apache.org/docs/stable/hadoop-auth/index.html"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/apacheds-kerberos-codec-2.0.0:0
	>=dev-java/curator-framework-2.7.1:0
	>=dev-java/zookeeper-3.4.6:0
	>=dev-java/commons-codec-1.7:0
	>=dev-java/httpcomponents-client-4.5:4
	>=dev-java/slf4j-api-1.7.28:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
		>=dev-java/hadoop-annotations-2.7.4:0
		java-virtuals/servlet-api:4.0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
	dev-java/log4j-12-api:2
	>=dev-java/slf4j-log4j12-1.7.28:0
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="servlet-api-4.0,hadoop-annotations"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_install() {
	java-pkg-simple_src_install
	java-pkg_register-dependency log4j-12-api-2,slf4j-log4j12
}
