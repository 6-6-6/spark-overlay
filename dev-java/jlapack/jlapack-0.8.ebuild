# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java translation of the BLAS and LAPACK libraries"
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
"

# ${PN}-3.1.1 is the directory for version 0.8
S="${WORKDIR}/f2j-${P}/${PN}-3.1.1"

JAVA_SRC_DIR="src/org"

src_compile() {
	# Although f2java generates both *.java and *.class, the Java source files
	# should not be compiled; otherwise there would be runtime errors like
	# "Warning: Untransformed {goto,label} remaining in program!"
	# https://icl.utk.edu/f2j/faq/index.html#316
	# The webpage mentions 'javab', whose source code is available but is
	# buggy, and it has a custom, restrictive license
	pushd src > /dev/null || die "Failed to enter to source directory"
	f2java -p org.netlib.err \
		error_reporting/err.f || die "Failed to compile err.f"
	f2java -d -c Error_reporting -p org.netlib.blas \
		blas/blas.f || die "Failed to compile blas.f"
	f2java -d -c Error_reporting:Blas -p org.netlib.lapack \
		lapack/lapack.f || die "Failed to compile lapack.f"
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
	java-pkg_register-dependency f2jutil

	# Install *.f2j files, which can be reused when building other Java
	# packages translated from Fortran that depend on this package
	local pkg_dirname="${PN}"
	[[ "${SLOT}" != "0" ]] && pkg_dirname+="-${SLOT}"
	insinto "/usr/share/${pkg_dirname}/f2j"
	doins src/{Error_reporting,Blas,Lapack}/*.f2j

	einstalldocs # https://bugs.gentoo.org/789582
}
