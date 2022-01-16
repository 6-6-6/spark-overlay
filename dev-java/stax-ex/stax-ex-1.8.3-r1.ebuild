# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jvnet.staxex:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4 pkgdiff"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Extensions to complement JSR-173 StAX API"
HOMEPAGE="https://javaee.github.io/metro-stax-ex/"
SRC_URI="
	https://github.com/eclipse-ee4j/jaxb-stax-ex/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://repo1.maven.org/maven2/org/jvnet/staxex/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"

# EDL-1.0 equivalent to BSD
# https://www.eclipse.org/org/documents/edl-v10.php
LICENSE="BSD"
SLOT="1"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/jakarta-activation-api:1
	dev-java/jaxb-api:2
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
	test? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/jaxb-${P}"

DOCS=( CONTRIBUTING.md NOTICE.md README.md )

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"

src_prepare() {
	java-pkg-2_src_prepare
	if use test && ver_test "$(java-config -g PROVIDES_VERSION)" -lt 9; then
		rm "${JAVA_TEST_SRC_DIR}/org/jvnet/staxex/util/ByteCodeVersionTest.java" ||
		die "Failed to remove test class that does not support Java 1.8"
	fi
}

src_install() {
	java-pkg-simple_src_install
	einstalldocs # https://bugs.gentoo.org/789582
}
