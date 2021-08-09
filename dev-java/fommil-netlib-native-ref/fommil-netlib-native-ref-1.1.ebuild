# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# TODO: Build this package's JNI shared library from source

EAPI=7

MAVEN_PROVIDES="
	com.github.fommil.netlib:native_ref-java:${PV}
	com.github.fommil.netlib:netlib-native_ref-linux-x86_64:${PV}
	com.github.fommil.netlib:netlib-native_ref-linux-armhf:${PV}
	com.github.fommil.netlib:netlib-native_ref-linux-i686:${PV}
"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN="native_ref"

DESCRIPTION="Mission-critical components for linear algebra systems"
HOMEPAGE="https://github.com/fommil/netlib-java"
SRC_URI="
	https://repo1.maven.org/maven2/com/github/fommil/netlib/${MY_PN}-java/${PV}/${MY_PN}-java-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/github/fommil/netlib/${MY_PN}-java/${PV}/${MY_PN}-java-${PV}.jar -> ${P}-bin.jar
	amd64? ( https://repo1.maven.org/maven2/com/github/fommil/netlib/netlib-${MY_PN}-linux-x86_64/${PV}/netlib-${MY_PN}-linux-x86_64-${PV}.so )
	arm? ( https://repo1.maven.org/maven2/com/github/fommil/netlib/netlib-${MY_PN}-linux-armhf/${PV}/netlib-${MY_PN}-linux-armhf-${PV}.so )
	x86? ( https://repo1.maven.org/maven2/com/github/fommil/netlib/netlib-${MY_PN}-linux-i686/${PV}/netlib-${MY_PN}-linux-i686-${PV}.so )
"
LICENSE="BSD"
SLOT="0"
KEYWORDS="-* ~amd64 ~amd64-linux"
RESTRICT+=" strip"

CP_DEPEND="
	dev-java/arpack-combined-all-bin:0
	dev-java/fommil-netlib-core:0
	dev-java/fommil-jniloader:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
		>=dev-java/lombok-1.16.16:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="lombok"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_install() {
	java-pkg-simple_src_install
	# Avoid installing symbolic link
	cp "${DISTDIR}"/*.so . || die "Failed to copy shared object to \${S}"
	java-pkg_doso *.so
}
