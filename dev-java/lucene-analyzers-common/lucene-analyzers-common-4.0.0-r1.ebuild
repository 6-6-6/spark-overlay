# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="source test"
MAVEN_ID="org.apache.lucene:${PN}:${PV}"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Additional Analyzers for Lucene"
HOMEPAGE="https://lucene.apache.org/"
SRC_URI="https://archive.apache.org/dist/lucene/java/${PV}/lucene-${PV}-src.tgz"

LICENSE="Apache-2.0"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"

# Tests require com.carrotsearch.randomizedtesting:junit4-ant,
# which is yet to be packaged
RESTRICT="test"

CP_DEPEND="
	~dev-java/lucene-${PV}:${SLOT}
"

DEPEND="
	>=virtual/jdk-1.8
	${CP_DEPEND}
	test? (
		dev-java/junit:4
		dev-java/randomized-runner:0
	)
"

RDEPEND="
	${CP_DEPEND}
	>=virtual/jre-1.8:*
"

# Do not descend into 'analysis/common' because build artifacts will be placed
# in the top-level directory
S="${WORKDIR}/lucene-${PV}"
EANT_BUILD_XML="analysis/common/build.xml"

JAVA_ANT_REWRITE_CLASSPATH="true"
JAVA_PKG_BSFIX_NAME="common-build.xml"
EANT_TEST_GENTOO_CLASSPATH="lucene-${SLOT},randomized-runner"

EANT_TEST_TARGET="test"
# A Javadoc target exists, but there are many HTML errors in Javadoc that
# prevent documentation build from succeeding
EANT_DOC_TARGET="javadocs"

src_prepare() {
	java-pkg-2_src_prepare
	eapply "${FILESDIR}/lucene-${PV}-skip-ivy.patch"
	eapply "${FILESDIR}/lucene-${PV}-skip-svnversion.patch"
	eapply "${FILESDIR}/lucene-modules-${PV}-use-system-lucene-core.patch"
	if use test; then
		eapply "${FILESDIR}/lucene-${PV}-randomized-runner-2.7.8.patch"
	fi
}

src_test() {
	java-pkg-2_src_test
}

src_install() {
	java-pkg_newjar build/analysis/common/*.jar
	use source && java-pkg_dosrc analysis/common/src/java/*
}
