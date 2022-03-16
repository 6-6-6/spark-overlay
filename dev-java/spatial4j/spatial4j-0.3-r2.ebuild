# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="com.spatial4j:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A Geospatial Library for Java"
HOMEPAGE="https://projects.eclipse.org/projects/locationtech.spatial4j"
SRC_URI="https://github.com/locationtech/spatial4j/archive/refs/tags/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/jts-core:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	test? (
		dev-java/randomized-runner:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/${PN}-${P}"

JAVA_SRC_DIR="src/main/java"

JAVA_TEST_GENTOO_CLASSPATH="
	junit-4
	randomized-runner
"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS=( "src/test/resources" )

src_prepare() {
	eapply "${FILESDIR}/${P}-update-JtsShapeReadWriter-for-newer-JTS.patch"
	use test && eapply "${FILESDIR}/${P}-add-missing-junit-imports.patch"
	java-pkg-2_src_prepare
	sed -i -e "s/com.vividsolutions/org.locationtech/g" \
		$(find "${JAVA_SRC_DIR}" "${JAVA_TEST_SRC_DIR}" -name "*.java") ||
		die "Failed to update source files for newer JTS versions"
}

src_install() {
	java-pkg-simple_src_install
	einstalldocs # https://bugs.gentoo.org/789582
}
