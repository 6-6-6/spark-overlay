# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.jruby.extras:${PN}:${PV}"

inherit java-pkg-2 java-ant-2

DESCRIPTION="JRuby support library"
HOMEPAGE="https://github.com/jruby/bytelist"
SRC_URI="https://github.com/jruby/bytelist/archive/${P}.tar.gz"

LICENSE="|| ( CPL-1.0 GPL-2 LGPL-2.1 )"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x86-solaris"

CP_DEPEND="
	dev-java/jcodings:0
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	test? (
		dev-java/junit:0
		dev-java/ant-junit:0
	)
"

S="${WORKDIR}/${PN}-${P}"

JAVA_ANT_REWRITE_CLASSPATH="true"
JAVA_ANT_CLASSPATH_TAGS="javac javadoc"

src_prepare() {
	cp "${FILESDIR}/maven-build.xml" build.xml || die
	java-pkg-2_src_prepare
}

src_test() {
	java-pkg-2_src_test
}

src_install() {
	java-pkg_dojar "target/${PN}.jar"

	use doc && java-pkg_dojavadoc target/site/apidocs
	use source && java-pkg_dosrc src/*
}
