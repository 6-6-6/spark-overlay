# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc examples source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Small XML Pull Parser"
HOMEPAGE="http://kxml.org/"
SRC_URI="mirror://sourceforge/${PN}/${PN}2-src-${PV}.zip"

LICENSE="BSD"
SLOT="2"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/xmlpull:0
	dev-java/xpp3:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_ANT_REWRITE_CLASSPATH="true"
JAVA_ANT_CLASSPATH_TAGS="javac javadoc"
EANT_BUILD_TARGET="build_jar"

src_prepare() {
	java-pkg_clean
	eapply "${FILESDIR}/${P}-unbundle-dependencies.patch"
	java-pkg-2_src_prepare
}

src_install() {
	java-pkg_newjar "dist/${PN}2-${PV}.jar" "${PN}.jar"
	java-pkg_newjar "dist/${PN}2-min-${PV}.jar" "${PN}-min.jar"

	use doc && java-pkg_dojavadoc www/kxml2/javadoc
	use examples && java-pkg_doexamples samples
	use source && java-pkg_dosrc src/org
}
