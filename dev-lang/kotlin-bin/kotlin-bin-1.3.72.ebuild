# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

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
	app-eselect/eselect-kotlin
"

S="${WORKDIR}/kotlinc"

src_install() {
	rm bin/*.bat || die
	dodoc license/NOTICE.txt
	rm -r license || die

	insinto "/opt/${PN}-${SLOT}"
	doins -r *
	for i in bin/*; do
		fperms +x "/opt/${PN}/$i"
		# Install versioned executables
		dosym "${EPREFIX}/usr/libexec/eselect-kotlin/run-kotlin-tool.sh" \
			"/usr/bin/${i//*\/}${SLOT}"
	done

	# Create and install Kotlin compiler package description file
	local pkg_desc="${T}/${PN}-${SLOT}"
	cat <<- _EOF_ > "${pkg_desc}" || \
		die "Failed to create Kotlin compiler package description file"
		GENTOO_KOTLIN_HOME="${EPREFIX}/${kotlin_home}"
		_EOF_
	insinto "/usr/share/eselect-kotlin/pkgs/${SLOT}"
	doins "${pkg_desc}"
}

pkg_postinst() {
	eselect kotlin update
}

pkg_postrm() {
	eselect kotlin cleanup
	eselect kotlin update
}
