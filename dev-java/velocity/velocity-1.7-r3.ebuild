# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# The version of hsqldb, a test dependency, in ::gentoo is incompatible
JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.apache.velocity:${PN}:${PV}"

inherit java-pkg-2 java-ant-2

DESCRIPTION="General purpose template engine"
HOMEPAGE="https://velocity.apache.org/engine/devel/"
SRC_URI="https://archive.apache.org/dist/velocity/engine/${PV}/${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="1.7"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/ant-core:0
	dev-java/avalon-logkit:2.0
	dev-java/commons-collections:0
	dev-java/commons-lang:2.1
	dev-java/commons-logging:0
	dev-java/jakarta-oro:2.0
	dev-java/jdom:0
	dev-java/log4j-12-api:2
	dev-java/log4j-core:2
	dev-java/werken-xpath:0
	java-virtuals/servlet-api:4.0
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

JAVA_ANT_REWRITE_CLASSPATH="true"
JAVA_ANT_CLASSPATH_TAGS="java javac javadoc"
EANT_BUILD_XML="build/build.xml"
EANT_DOC_TARGET="javadocs"
EANT_EXTRA_ARGS="-Dskip-download=true"

src_prepare() {
	java-pkg_clean
	eapply "${FILESDIR}/${P}-r3-migrate-to-log4j-12-api.patch"
	java-pkg-2_src_prepare
}

src_install() {
	java-pkg_newjar "bin/${P}.jar" "${PN}.jar"

	use doc && java-pkg_dojavadoc bin/apidocs
	use source && java-pkg_dosrc bin/src/*
}
