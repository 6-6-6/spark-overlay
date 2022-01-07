# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="source test"
MAVEN_ID="org.apache.lucene:lucene-core:${PV}"

inherit java-pkg-2 java-ant-2

DESCRIPTION="High-performance, full-featured text search engine written entirely in Java"
HOMEPAGE="https://lucene.apache.org/"
SRC_URI="https://archive.apache.org/dist/lucene/java/${PV}/${P}-src.tgz"

LICENSE="Apache-2.0"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64 ~x86"

# Tests require com.carrotsearch.randomizedtesting:junit4-ant,
# which is yet to be packaged
RESTRICT="test"

DEPEND="
	>=virtual/jdk-1.8
	test? (
		dev-java/junit:4
		dev-java/randomized-runner:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

JAVA_ANT_REWRITE_CLASSPATH="true"
JAVA_PKG_BSFIX_NAME="common-build.xml"
EANT_TEST_GENTOO_CLASSPATH="randomized-runner"

EANT_BUILD_TARGET="jar-core"
EANT_TEST_TARGET="test-core"
# A Javadoc target exists, but there are many HTML errors in Javadoc that
# prevent documentation build from succeeding
EANT_DOC_TARGET="javadocs-lucene-core"

src_prepare() {
	java-pkg-2_src_prepare
	eapply "${FILESDIR}/${P}-skip-ivy.patch"
	eapply "${FILESDIR}/${P}-skip-svnversion.patch"
	if use test; then
		eapply "${FILESDIR}/${P}-skip-failing-tests.patch"
		eapply "${FILESDIR}/${P}-randomized-runner-2.7.8.patch"
	fi
}

src_test() {
	java-pkg-2_src_test
}

src_install() {
	java-pkg_newjar build/core/*.jar
	use source && java-pkg_dosrc core/src/java/*
}
