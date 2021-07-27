# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.bouncycastle:bcpg-jdk15on:${PV}"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java cryptography APIs"
HOMEPAGE="https://www.bouncycastle.org/java.html"
SRC_URI="https://github.com/bcgit/bc-java/archive/refs/tags/r${PV/./rv}.tar.gz -> bc-java-r${PV/./rv}.tar.gz"

LICENSE="BSD"
SLOT="1.52"
KEYWORDS="~amd64 ~ppc64 ~x86"

# Depend on slotted dev-java/bcprov-1.52 in this overlay
# This package fails to compile when bcprov-1.68 is used
CP_DEPEND="
	dev-java/bcprov:1.52
"

DEPEND="
	${CP_DEPEND}
	>=virtual/jdk-1.8:*
"

RDEPEND="
	${CP_DEPEND}
	>=virtual/jre-1.8:*
"

HTML_DOCS=( ../{CONTRIBUTORS,index,LICENSE}.html )

S="${WORKDIR}/bc-java-r${PV/./rv}/pg"

JAVA_SRC_DIR=(
	"src/main/java"
)
#	JAVA_RESOURCE_DIRS="src/main/resources"	# Does not exist

src_prepare() {
	default
	cd ../ || die
	java-pkg_clean
}

src_install() {
	default
	einstalldocs
	docinto html
	dodoc -r ../docs
	java-pkg-simple_src_install
}
