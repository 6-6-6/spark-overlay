# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
JAVA_PKG_IUSE="doc source"
MAVEN_ID="colt:${PN}:${PV}"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Java Libraries for High Performance Scientific and Technical Computing"
HOMEPAGE="https://dst.lbl.gov/ACSSoftware/colt/"
SRC_URI="https://dst.lbl.gov/ACSSoftware/colt/colt-download/releases/${P}.tar.gz"

LICENSE="colt"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}/${PN}"

EANT_BUILD_TARGET="javac jar"
JAVA_ANT_ENCODING="ISO-8859-1"

src_prepare() {
	java-pkg_clean
	eapply -p0 "${FILESDIR}/${P}-benchmark-no-deprecation.patch"
	eapply -p0 "${FILESDIR}/${P}-remove-concurrent-util-imports.patch"
	eapply -p0 "${FILESDIR}/${P}-set-encoding-for-javadoc.patch"
	java-pkg-2_src_prepare
}

src_install() {
	java-pkg_dojar "lib/${PN}.jar"
	einstalldocs

	use doc && java-pkg_dojavadoc doc/api
	use source && java-pkg_dosrc src/*
}
