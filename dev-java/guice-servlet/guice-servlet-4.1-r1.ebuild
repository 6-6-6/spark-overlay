# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Guice servlet extension"
HOMEPAGE="https://github.com/google/guice/"
SRC_URI="https://github.com/google/guice/archive/${PV}.tar.gz -> guice-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="4"
KEYWORDS="~amd64 ~ppc64 ~x86"

CP_DEPEND="
	dev-java/guice:4
	dev-java/aopalliance:1
	>=dev-java/asm-5:4
	>=dev-java/cglib-3.1:3
	dev-java/guava:0
	dev-java/javax-inject:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/guice-${PV}/extensions/servlet"

JAVA_ANT_REWRITE_CLASSPATH="yes"

src_configure() {
	# Run default src_configure without build file fixes
	JAVA_PKG_BSFIX="off" java-ant-2_src_configure

	# Manually fix build files
	java-ant_bsfix_files build.xml ../../common.xml
}

src_compile() {
	java-pkg-2_src_compile
	mv "build/${PN}-snapshot.jar" "build/${PN}.jar"
}

src_install() {
	java-pkg_dojar "build/${PN}.jar"
	use source && java-pkg_dosrc src/*
}
