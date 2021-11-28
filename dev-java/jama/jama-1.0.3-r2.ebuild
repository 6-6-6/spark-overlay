# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="gov.nist.math:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple

MY_PN="Jama"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A Java Matrix Package"
HOMEPAGE="https://math.nist.gov/javanumerics/jama/"
SRC_URI="
	https://math.nist.gov/javanumerics/${PN}/${MY_P}.tar.gz -> ${P}.tar.gz
	https://repo1.maven.org/maven2/gov/nist/math/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_prepare() {
	java-pkg-2_src_prepare
	java-pkg_clean
}

src_compile() {
	java-pkg-simple_src_compile
	use binary && return

	# Add files included in the upstream's pre-built JAR
	pushd "${JAVA_SRC_DIR}" > /dev/null || die "Failed to enter JAVA_SRC_DIR"
	jar uf "${S}/${JAVA_JAR_FILENAME}" "${MY_PN}"/{ChangeLog,time} ||
		die "Failed to add additional files to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
}
