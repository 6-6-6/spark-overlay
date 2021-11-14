# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="source"
MAVEN_ID="org.conscrypt:conscrypt-constants:1.0.0.RC1"

inherit java-pkg-2 java-pkg-simple toolchain-funcs

DESCRIPTION="Conscrypt: Constants"
HOMEPAGE="https://conscrypt.org/"
SRC_URI="https://github.com/google/conscrypt/archive/refs/tags/${PV}.tar.gz -> conscrypt-${PV}.tar.gz"
LICENSE="Apache-2.0"
SLOT="${PV}"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	dev-libs/openssl
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}/conscrypt-${PV}"

JAVA_SRC_DIR="src/main/java"

src_prepare() {
	eapply "${FILESDIR}/${PN}-1.3.0-remove-missing-members.patch"
	eapply_user
}

src_compile() {
	mkdir -p "${JAVA_SRC_DIR}/org/conscrypt" ||
		die "Failed to create output directory for generated code"
	"$(tc-getBUILD_CXX)" -o generate_constants \
		constants/src/gen/cpp/generate_constants.cc ||
		die "Failed to compile NativeConstants.java generator"
	./generate_constants > \
		"${JAVA_SRC_DIR}/org/conscrypt/NativeConstants.java" ||
		die "Failed to generate NativeConstants.java"
	java-pkg-simple_src_compile
}
