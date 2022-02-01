# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Consumer packages should not depend on this package; they should depend on
# the non-bootstrap variant instead.  To prevent providing the JAR to consumer
# packages, this ebuild does not inherit any Java eclasses; it does not need
# to do so either because its only task is to copy a file to the system.

inherit readme.gentoo-r1

MY_PN="${PN%-bootstrap}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Bootstrap package for dev-java/${MY_PN}"
HOMEPAGE="https://kotlinlang.org"
SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${MY_PN}/${PV}/${MY_P}.jar"

LICENSE="Apache-2.0 BSD MIT NPL-1.1"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"

RDEPEND="
	!dev-java/${MY_PN}:${SLOT}
"

S="${WORKDIR}"

DOC_CONTENTS="
This is only a bootstrap package for ${MY_PN}-${SLOT}; it does not provide
${MY_PN}-${SLOT} to other packages or programs.  To use ${MY_PN}-${SLOT} with
other packages or programs, please continue its bootstrap process by running
the following command (which will automatically uninstall this package):\n
\n
emerge --ask --oneshot dev-java/${MY_PN}:${SLOT}
"

src_unpack() {
	# Skip JAR unpack as it will be installed directly
	for file in ${A}; do
		cp -v "${DISTDIR}/${file}" "${S}" ||
			die "Failed to copy ${file} to \${S}"
	done
}

src_compile() {
	: # Skip compilation for binary package
}

src_install() {
	insinto "/usr/share/${MY_PN}-${SLOT}/lib"
	newins "${S}/${MY_P}.jar" "${MY_PN}.jar"
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
