# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

MY_PN="wstx-asl"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Woodstox is a high-performance validating namespace-aware XML-processor"
HOMEPAGE="https://github.com/FasterXML/woodstox"
SRC_URI="https://repo1.maven.org/maven2/org/codehaus/woodstox/${MY_PN}/${PV}/${MY_P}-sources.jar"
LICENSE="Apache-2.0"
SLOT="3.2"
KEYWORDS="~amd64 ~ppc64 ~x86"

CDEPEND="
	dev-java/sax:0
	dev-java/msv:0
	dev-java/relaxng-datatype:0"

RDEPEND="
	${CDEPEND}
	>=virtual/jre-1.8:*"

BDEPEND="
	app-arch/unzip"

DEPEND="
	${CDEPEND}
	>=virtual/jdk-1.8:*"

EANT_BUILD_TARGET="jars"
EANT_DOC_TARGET="javadoc"

# Don't need to make a folder
S="${WORKDIR}"

JAVA_ANT_REWRITE_CLASSPATH="true"

PATCHES=(
	"${FILESDIR}/${PN}-3.2.9-0001-build-xml-remove-missing-include.patch"
	"${FILESDIR}/${PN}-3.2.9-0002-build.xml-Skip-release-notes.patch"
)

src_prepare() {
	default

	mkdir -p lib/msv || die "Failed to create directory required by build.xml"
}

EANT_GENTOO_CLASSPATH="sax,msv,relaxng-datatype"

src_install() {
	java-pkg_newjar build/"${PN}"-api-"${PV}".jar "${PN}"-api.jar
	java-pkg_newjar build/"${PN}"-asl-"${PV}".jar "${PN}".jar
	use doc && java-pkg_dojavadoc build/javadoc
	use source && java-pkg_dosrc src
}
