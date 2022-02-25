# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.apache.zookeeper:${PN}:${PV}"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Server which enables highly reliable distributed coordination"
HOMEPAGE="https://zookeeper.apache.org/"
SRC_URI="https://archive.apache.org/dist/zookeeper/${P}/${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Missing test dependencies:
# - org.apache.directory.api.ldap.schemaextractor
# - org.apache.directory.api.ldap.schemaloader
# - org.apache.directory.api.ldap.schemamanager
# - org.apache.directory.server.constants
# - org.apache.directory.server.core
# - org.apache.directory.server.kerberos
# - org.apache.directory.server.protocol
# - org.apache.directory.server.xdbm
# - org.apache.kerby
RESTRICT="test"

CP_DEPEND="
	>=dev-java/audience-annotations-0.5.0:0
	dev-java/jline:0
	dev-java/log4j-12-api:2
	>=dev-java/netty-3.10.6:0
	>=dev-java/slf4j-api-1.7.28:0
	>=dev-java/spotbugs-annotations-3.1.9:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	test? (
		dev-java/junit:4
		dev-java/apacheds-kerberos-codec:0
		dev-java/api-ldap-model:0
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

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_TEST_GENTOO_CLASSPATH="apacheds-kerberos-codec,api-ldap-model"
EANT_TEST_GENTOO_CLASSPATH+=",commons-collections,commons-io-1"
EANT_TEST_GENTOO_CLASSPATH+=",commons-lang-2.1,hamcrest-library-1.3,mockito"
# Some dependencies in CP_DEPEND and transitive dependencies used by the tests
# need to be explicitly listed to avoid "package does not exist" errors
EANT_TEST_GENTOO_CLASSPATH+=",log4j-12-api-2,netty,slf4j-api"

src_prepare() {
	java-pkg_clean
	eapply "${FILESDIR}/${P}-skip-ivy.patch"
	eapply "${FILESDIR}/${P}-log4j-12-api.patch"
	eapply "${FILESDIR}/${P}-javadoc-doclet.patch"
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
