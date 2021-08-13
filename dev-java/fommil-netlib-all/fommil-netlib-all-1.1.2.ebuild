# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="com.github.fommil.netlib:all:${PV}"

inherit java-pkg-2

DESCRIPTION="Meta Package for installing all netlib-java components"
HOMEPAGE="https://github.com/fommil/netlib-java"
SRC_URI=""
LICENSE="metapackage"
SLOT="0"
KEYWORDS="~amd64"

# Meta package, no Java source is compiled, need not depend on JDK
DEPEND="
	>=virtual/jre-1.8:*
"

RDEPEND="
	${DEPEND}
	~dev-java/fommil-netlib-core-${PV}:0
	~dev-java/fommil-netlib-native-ref-1.1:0
	~dev-java/fommil-netlib-native-system-1.1:0
"

S="${WORKDIR}"

src_compile() {
	:
}

src_install() {
	java-pkg_register-dependency \
		"fommil-netlib-core,fommil-netlib-native-ref,fommil-netlib-native-system"
}
