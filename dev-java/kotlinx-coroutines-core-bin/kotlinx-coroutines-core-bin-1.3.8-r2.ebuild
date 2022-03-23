# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MAVEN_ID="org.jetbrains.kotlinx:kotlinx-coroutines-core:${PV}"

inherit java-pkg-2 java-pkg-simple

MY_PN="${PN%-bin}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Coroutines support libraries for Kotlin"
HOMEPAGE="https://github.com/Kotlin/kotlinx.coroutines"
SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlinx/${MY_PN}/${PV}/${MY_P}.jar"

LICENSE="Apache-2.0"
SLOT="1.3.8"
KEYWORDS="~amd64"

RDEPEND="
	>=virtual/jre-1.8:*
"

src_unpack() {
	: # Binary package, no source to unpack or compile
}

src_compile() {
	cp "${DISTDIR}/${MY_P}.jar" "${JAVA_JAR_FILENAME}" || \
		die "Failed to copy JAR to JAVA_JAR_FILENAME"
}

src_install() {
	java-pkg_jarinto "/opt/${PN}-${SLOT}/lib"
	java-pkg-simple_src_install
	java-pkg_register-optional-dependency "kotlin-stdlib-1.4"
}
