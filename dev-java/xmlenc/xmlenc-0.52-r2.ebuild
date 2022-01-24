# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="xmlenc:${PN}:${PV}"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Lightweight XML encoding library for Java, optimized for performance"
HOMEPAGE="https://sourceforge.net/projects/xmlenc/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	test? (
		dev-java/ant-junit:0
		dev-java/junit:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_TEST_TARGET="do-tests"

src_prepare() {
	java-pkg_clean
	java-pkg-2_src_prepare
}

src_test() {
	java-pkg-2_src_test
}

src_install() {
	java-pkg_dojar "build/${PN}.jar"
	einstalldocs

	use doc && java-pkg_dojavadoc build/javadoc
	use source && java-pkg_dosrc src/main/*
}
