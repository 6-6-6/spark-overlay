# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.xerial.snappy:snappy-java:1.1.7.8"

inherit java-pkg-2 java-ant-2 toolchain-funcs

MY_PN="${PN}-java"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Snappy compressor/decompressor for Java"
HOMEPAGE="https://github.com/xerial/snappy-java/"
SRC_URI="https://github.com/xerial/${MY_PN}/archive/${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="1.1"
KEYWORDS="~amd64"

CDEPEND="dev-java/osgi-core-api:0
	app-arch/snappy
	dev-libs/bitshuffle"

DEPEND=">=virtual/jdk-1.8:*
	test? (
		dev-java/ant-junit4:0
		dev-java/hadoop-common:0
		dev-java/plexus-classworlds:0
		dev-java/xerial-core:0
	)
	${CDEPEND}"

RDEPEND=">=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}/${MY_P}"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_GENTOO_CLASSPATH="osgi-core-api"
EANT_TEST_GENTOO_CLASSPATH="
	${EANT_GENTOO_CLASSPATH}
	hadoop-common
	plexus-classworlds
	xerial-core
"

src_prepare() {
	java-pkg-2_src_prepare
	cp "${FILESDIR}/1.x-build.xml" build.xml || die
	rm -r src/main/resources/org/xerial/snappy/native || die
	eapply "${FILESDIR}/${PV}-remove-perl-usage.patch"
	eapply "${FILESDIR}/${PV}-unbundle-snappy.patch"
	eapply "${FILESDIR}/${PV}-unbundle-bitshuffle.patch"
	eapply "${FILESDIR}/${PV}-gentoo.patch"
}

src_compile() {
	emake CXX="$(tc-getCXX)"
	java-pkg-2_src_compile
}

src_test() {
	cp -r src/test/resources/org/xerial/snappy/* \
		src/test/java/org/xerial/snappy || die
	java-pkg-2_src_test
}

src_install() {
	local jniext=.so
	if [[ ${CHOST} == *-darwin* ]] ; then
		jniext=.jnilib
		# avoid install_name check failure
		install_name_tool -id "@loader_path/libsnappyjava${jniext}" \
			"target/libsnappyjava${jniext}"
	fi
	java-pkg_doso "target/libsnappyjava${jniext}"
	java-pkg_dojar "target/${PN}.jar"

	use source && java-pkg_dosrc src/main/java/*
	use doc && java-pkg_dojavadoc target/site/apidocs
}
