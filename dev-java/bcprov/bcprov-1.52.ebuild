# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# This is a slotted ebuild for dev-java/bcprov-1.52.  As of July 2021, there is
# an ebuild for the same version in ::gentoo, but it is not slotted, and some
# packages like dev-java/bcpg-1.52 must be built against this particular
# version rather than any newer versions, so this old version must be
# installable in parallel with newer versions, hence this ebuild was created.

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.bouncycastle:bcprov-jdk15on:${PV}"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java cryptography APIs"
HOMEPAGE="https://www.bouncycastle.org/java.html"
SRC_URI="https://github.com/bcgit/bc-java/archive/refs/tags/r${PV/./rv}.tar.gz -> bc-java-r${PV/./rv}.tar.gz"

LICENSE="BSD"
SLOT="1.52"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"

DEPEND=">=virtual/jdk-1.8:*"
RDEPEND=">=virtual/jre-1.8:*"
BDEPEND="app-arch/zip"

HTML_DOCS=( ../{CONTRIBUTORS,index,LICENSE}.html )

S="${WORKDIR}/bc-java-r${PV/./rv}/prov"

JAVA_SRC_DIR=(
	"src/main/java"
	"../core/src/main/java"	# package org.bouncycastle.asn1 does not exist
)
JAVA_RESOURCE_DIRS="src/main/resources"

src_prepare() {
	default
	cd ../ || die
	java-pkg_clean
}

src_install() {
	default
	docinto html
	dodoc -r ../docs

	# These files are not present in the upstream jar but are used for tests
	# Removing them from the jar file after testing
	zip --delete "${S}"/bcprov.jar \
		"org/bouncycastle/pqc/crypto/ntru/*" \
		"org/bouncycastle/pqc/math/ntru/*" \
		|| die "cleaning after tests failed"

	java-pkg-simple_src_install
}
