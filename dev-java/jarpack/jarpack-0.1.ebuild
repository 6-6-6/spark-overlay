# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java translation of the ARPACK libraries"
HOMEPAGE="http://icl.cs.utk.edu/f2j/"
SRC_URI="https://github.com/Leo3418/f2j/archive/refs/tags/${P}.tar.gz"

# src/LICENSE: "The license covering the f2j source code is basically GPL with
# the addition of the BSD advertising clause."
LICENSE="BSD-4 GPL-2"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	dev-lang/f2j
"

DEPEND="
	>=virtual/jdk-1.8:*
	doc? (
		dev-java/f2jutil:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	dev-java/f2jutil:0
	dev-java/jlapack:0
"

S="${WORKDIR}/f2j-${P}/${PN}"

JAVA_SRC_DIR="SRC/org"

# Please see dev-java/jlapack ebuild for more information about why a package
# that is built by f2java needs to be written in this way

src_compile() {
	f2java -p org.netlib.arpack UTIL/util.f || die "Failed to compile util.f"
	pushd SRC > /dev/null || die "Failed to enter to source directory"
	f2java -d -c "../UTIL:${ESYSROOT}/usr/share/jlapack/f2j" \
		-p org.netlib.arpack arpack.f || die "Failed to compile arpack.f"
	cp -r ../org . || die "Failed to copy f2java output files"
	jar cf "${S}/${JAVA_JAR_FILENAME}" $(find org -name "*.class") ||
		die "jar failed"
	popd > /dev/null || die "Failed to leave to source directory"

	if use doc; then
		local apidoc="target/api"
		local classpath="$(java-pkg_getjars --build-only f2jutil)"
		mkdir -p "${apidoc}" || die "Failed to create Javadoc output directory"
		ejavadoc -d "${apidoc}" \
			-encoding "${JAVA_ENCODING}" -docencoding UTF-8 -charset UTF-8 \
			-classpath "${classpath}" ${JAVADOC_ARGS:- -quiet} \
			$(find "${JAVA_SRC_DIR}" -name "*.java")
	fi
}

src_install() {
	java-pkg-simple_src_install
	java-pkg_register-dependency f2jutil jlapack

	local pkg_dirname="${PN}"
	[[ "${SLOT}" != "0" ]] && pkg_dirname+="-${SLOT}"
	insinto "/usr/share/${pkg_dirname}/f2j"
	doins {SRC,UTIL}/*.f2j

	einstalldocs # https://bugs.gentoo.org/789582
}
