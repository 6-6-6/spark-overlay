# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source"
MAVEN_ID="werken-xpath:${PN}:${PV}"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Werken JDOM XPath Engine"
HOMEPAGE="https://github.com/Obsidian-StudiosInc/werken-xpath"
SRC_URI="https://github.com/Obsidian-StudiosInc/werken-xpath/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/jdom:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	dev-java/antlr:0
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

DOCS=( LIMITATIONS README TODO )

JAVA_ANT_REWRITE_CLASSPATH="true"
JAVA_ANT_CLASSPATH_TAGS="java javac javadoc"
EANT_BUILD_TARGET="package"

pkg_setup() {
	EANT_GENTOO_CLASSPATH_EXTRA="$(java-pkg_getjars \
		--build-only --with-dependencies antlr)"
}

src_prepare() {
	java-pkg_clean
	eapply "${FILESDIR}/${P}-fix-jdom-api-usage.patch"
	eapply "${FILESDIR}/${P}-fix-syntax.patch"
	java-pkg-2_src_prepare
}

src_install() {
	java-pkg_newjar "build/${PN//-/.}.jar" "${PN}.jar"
	einstalldocs

	use doc && java-pkg_dojavadoc build/apidocs
	use source && java-pkg_dosrc src/*
}
