# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# JUnit Jupiter is needed for tests
JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.hdrhistogram:${PN}:${PV}"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A High Dynamic Range (HDR) Histogram"
HOMEPAGE="https://hdrhistogram.github.io/HdrHistogram/"
SRC_URI="https://github.com/HdrHistogram/HdrHistogram/archive/refs/tags/${P}.tar.gz"
LICENSE="|| ( public-domain BSD-2 )"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}/${PN}-${P}"

JAVA_SRC_DIR="src/main/java"

JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS=( "src/test/resources" )

src_prepare() {
	java-pkg-2_src_prepare
	cp "${JAVA_SRC_DIR}/org/HdrHistogram/"Version.java{.template,} ||
		die "Failed to copy Version.java"
	sed -i -e "s/\$VERSION\$/${PV}/g" \
		"${JAVA_SRC_DIR}/org/HdrHistogram/Version.java" ||
		die "Failed to write package version to Version.java"
	sed -i -e "s/\$BUILD_TIME\$/$(date --utc '+%FT%TZ')/g" \
		"${JAVA_SRC_DIR}/org/HdrHistogram/Version.java" ||
		die "Failed to write build time to Version.java"
}

src_install() {
	java-pkg-simple_src_install
	einstalldocs # https://bugs.gentoo.org/789582
}
