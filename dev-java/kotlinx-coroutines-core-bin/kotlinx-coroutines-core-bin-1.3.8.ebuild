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

# No dependency declaration for dev-java/kotlin-common-bin because it is a
# transitive dependency via dev-lang/kotlin-bin, and declaring it here would
# always cause its latest slot to be pulled during first-time installation
RDEPEND="
	>=virtual/jre-1.8:*
"

# Binary package, permitted to use JRE in DEPEND
DEPEND="${RDEPEND}"

# It is impossible to use Coroutines outside Kotlin,
# so dev-lang/kotlin-bin is required
PDEPEND="
	dev-lang/kotlin-bin
"

src_install() {
	java-pkg_jarinto "/opt/${PN}-${SLOT}/lib"
	java-pkg-simple_src_install
}
