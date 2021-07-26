# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kotlin-compiler

DESCRIPTION="Statically typed programming language for modern multiplatform applications"
HOMEPAGE="https://kotlinlang.org/"
SRC_URI="https://github.com/JetBrains/kotlin/releases/download/v${PV}/kotlin-compiler-${PV}.zip"

LICENSE="Apache-2.0 BSD MIT NPL-1.1"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="app-shells/bash
	>=virtual/jdk-1.8
	>=virtual/jre-1.8
"

S="${WORKDIR}/kotlinc"

KOTLIN_COMPILER_HOME="/opt/${PN}-${SLOT}"

src_install() {
	rm bin/*.bat || die
	dodoc license/NOTICE.txt
	rm -r license || die

	insinto "${KOTLIN_COMPILER_HOME}"
	doins -r *
	for i in bin/*; do
		fperms +x "${KOTLIN_COMPILER_HOME}/$i"
	done
}
