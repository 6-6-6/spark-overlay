# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="net.sf.opencsv:opencsv:2.3"

JAVA_PKG_IUSE="doc source test"

inherit java-pkg-2 java-ant-2

DESCRIPTION="A very simple csv (comma-separated values) parser library for Java"
HOMEPAGE="http://opencsv.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}-src-with-libs.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"

DEPEND="
	>=virtual/jdk-1.8:*
	test? (
		dev-java/junit:4
		dev-java/ant-junit4:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

JAVA_ANT_REWRITE_CLASSPATH="yes"

src_unpack() {
	default
	java-pkg_clean
}

src_prepare() {
	if use test; then
		for patch in "${FILESDIR}/${P}-test"-*.patch; do
			eapply "${patch}"
		done
	fi

	eapply_user
}

src_compile() {
	java-pkg-2_src_compile
	mv "deploy/${P}.jar" "deploy/${PN}.jar"
}

src_test() {
	java-pkg-2_src_test
}

src_install() {
	java-pkg_dojar "deploy/${PN}.jar"
	use doc && java-pkg_dojavadoc doc/
	use source && java-pkg_dosrc src/*
}
