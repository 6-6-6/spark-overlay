# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE=""
MAVEN_ID="org.jetbrains.kotlinx:kotlinx-coroutines-core:${PV}"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Coroutines support libraries for Kotlin"
HOMEPAGE="https://github.com/Kotlin/kotlinx.coroutines"
SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlinx/kotlinx-coroutines-core/${PV}/kotlinx-coroutines-core-${PV}.jar"
LICENSE="Apache-2.0"
SLOT="1.3.8"
KEYWORDS="~amd64"

# Binary package, permitted to use JRE in DEPEND
DEPEND=">=virtual/jre-1.8:*"

RDEPEND="
	${DEPEND}
	>=dev-java/kotlin-stdlib-1.3.71:*
"

src_install() {
	java-pkg_jarinto "/opt/${PN}-${SLOT}/lib"
	java-pkg-simple_src_install
}
