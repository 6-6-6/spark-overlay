# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_PROVIDES="org.jetbrains.kotlin:kotlin-stdlib:1.3.72 org.jetbrains.kotlin:kotlin-stdlib-common:1.3.72 org.jetbrains.kotlin:kotlin-reflect:1.3.72"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Pseudo kotlin libs"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="https://github.com/JetBrains/kotlin/releases/download/v${PV}/kotlin-compiler-${PV}.zip"

LICENSE="Apache-2.0 BSD MIT NPL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

RDEPEND="
	>=virtual/jre-1.8
"
DEPEND="
	>=virtual/jdk-1.8
"

S="${WORKDIR}/kotlinc"

src_unpack() {
	default
}

src_install() {
	local lib_jars=(
		$(find "${S}/lib" -type f -name '*.jar' -not -name '*-sources.jar')
	)
	java-pkg_dojar "${lib_jars[@]}"
	if use source; then
		local source_jars=( "${S}/lib"/*-sources.jar )
		insinto "${JAVA_PKG_SOURCESPATH}"
		doins "${source_jars[@]}"
	fi
}
