# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.apache.zookeeper:${PN}:${PV}"

# Note: This is the last version that still provides build.xml
inherit java-pkg-2 java-ant-2

DESCRIPTION="Server which enables highly reliable distributed coordination"
HOMEPAGE="https://zookeeper.apache.org/"
SRC_URI="mirror://apache/zookeeper/${P}/apache-${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Missing test dependencies:
# - >=dev-java/mockito-2.27.0
# - org.apache.kerby
RESTRICT="test"

CP_DEPEND="
	dev-java/audience-annotations:0
	dev-java/commons-cli:1
	dev-java/jackson-core:0
	dev-java/jackson-databind:0
	dev-java/jetty-http:9
	dev-java/jetty-io:9
	dev-java/jetty-security:9
	dev-java/jetty-server:9
	dev-java/jetty-servlet:9
	dev-java/jetty-util:9
	dev-java/jetty-util-ajax:9
	dev-java/jline:2
	dev-java/json-simple:0
	dev-java/netty-buffer:0
	dev-java/netty-codec:0
	dev-java/netty-common:0
	dev-java/netty-handler:0
	dev-java/netty-resolver:0
	dev-java/netty-transport:0
	dev-java/netty-transport-native-epoll:0
	dev-java/netty-transport-native-unix-common:0
	dev-java/slf4j-api:0
	dev-java/spotbugs-annotations:0
	dev-java/tomcat-servlet-api:3.1
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	dev-java/javacc:0
	test? (
		dev-java/junit:4
		dev-java/bcpkix:0
		dev-java/bcprov:0
		dev-java/commons-collections:0
		dev-java/commons-io:1
		dev-java/commons-lang:2.1
		dev-java/hamcrest-library:1.3
		dev-java/mockito:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/apache-${P}"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_TEST_GENTOO_CLASSPATH="bcpkix,bcprov,commons-collections,commons-io-1"
EANT_TEST_GENTOO_CLASSPATH+=",commons-lang-2.1,hamcrest-library-1.3,mockito"
# Some dependencies in CP_DEPEND and transitive dependencies used by the tests
# need to be explicitly listed to avoid "package does not exist" errors
EANT_TEST_GENTOO_CLASSPATH+=",netty-buffer,netty-common"

pkg_setup() {
	java-pkg-2_pkg_setup
	EANT_EXTRA_ARGS+=" -Divy.javacc.lib=$(dirname "$(\
		java-pkg_getjar --build-only javacc javacc.jar)")"
}

src_prepare() {
	java-pkg_clean
	eapply "${FILESDIR}/${PN}-3.5.9-skip-ivy.patch"
	eapply "${FILESDIR}/${PN}-3.4.14-javadoc-doclet.patch"
	java-pkg-2_src_prepare
}

src_test() {
	java-pkg-2_src_test
}

src_install() {
	java-pkg_newjar "build/${P}.jar" "${PN}.jar"

	use doc && java-pkg_dojavadoc build/docs/api
	use source && java-pkg_dosrc zookeeper-server/src/main/java/*
}
