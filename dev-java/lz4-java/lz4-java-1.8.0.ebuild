# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.lz4:lz4-java:1.8.0"

inherit java-pkg-2 java-ant-2

DESCRIPTION="LZ4 compression for Java"
HOMEPAGE="https://github.com/lz4/lz4-java"
SRC_URI="https://github.com/lz4/lz4-java/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Tests require com.carrotsearch.randomizedtesting:junit4-ant,
# which is yet to be packaged
RESTRICT="test"

CDEPEND="
	app-arch/lz4
"

# The version requirement on mvel is strict; mvel-2.4.* generates source files
# incorrectly, which causes build failure of this package
DEPEND="
	>=virtual/jdk-1.8:*
	dev-java/cpptasks:0
	~dev-java/mvel-2.3.2:0
	dev-libs/xxhash
	test? (
		dev-java/junit:4
		dev-java/randomized-runner:0
	)
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
"

EANT_DOC_TARGET="docs"
EANT_TEST_GENTOO_CLASSPATH="randomized-runner"

pkg_setup() {
	java-pkg-2_pkg_setup
	EANT_GENTOO_CLASSPATH_EXTRA="$(java-pkg_getjars --build-only \
		cpptasks,mvel)"
}

src_prepare() {
	java-pkg-2_src_prepare
	rm -r src/resources || die "Failed to remove pre-built shared libraries"
	eapply "${FILESDIR}/${P}-skip-ivy.patch"
	eapply "${FILESDIR}/${P}-use-system-lz4.patch"
	cp "${FILESDIR}/${P}-gentoo-classpath.xml" gentoo-classpath.xml ||
		die "Failed to copy Gentoo classpath injection XML"
}

src_test() {
	java-pkg-2_src_test
}

src_install() {
	java-pkg_newjar 'dist/${ivy.module}.jar'
	java-pkg_doso $(find build/jni -name "*.so")
	use doc && java-pkg_dojavadoc build/docs
	# Ant project's 'sources' target generates a source JAR rather than a Zip
	# archive; we simply let java-utils-2.eclass create the source Zip archive
	# from the same source directories the 'sources' target would access
	# https://github.com/lz4/lz4-java/blob/1.8.0/build.xml#L323-L330
	use source && java-pkg_dosrc src/java/* src/java-unsafe/*
}
