# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE=""
MAVEN_ID="org.jetbrains.kotlin:kotlin-coroutines-experimental-compat:${PV}"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Kotlin Coroutines Experimental Compat"
HOMEPAGE="https://kotlinlang.org"
SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-coroutines-experimental-compat/${PV}/kotlin-coroutines-experimental-compat-${PV}.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=virtual/jre-1.8:*
	>=dev-java/kotlin-common-bin-1.4.32:*
"

# Binary package, permitted to use JRE in DEPEND
DEPEND="${RDEPEND}"

src_install() {
	java-pkg_jarinto "/opt/${PN}/lib"
	java-pkg-simple_src_install
}
