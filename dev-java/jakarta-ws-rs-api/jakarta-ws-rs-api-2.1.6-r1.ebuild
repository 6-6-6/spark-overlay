# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="VIRTUAL:PROVIDED:0"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta RESTful Web Services API"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jaxrs"
# GitHub repository was migrated to a different name, resulting in a
# rename of the top-level directory in the tarball and thus causing
# changes in checksums.  To avoid manifest check failure, a suffix
# is added after P in tarball's name.  Please remember to remove the
# suffix when updating to a new upstream release.
SRC_URI="https://github.com/jakartaee/rest/archive/refs/tags/${PV}.tar.gz -> ${P}-r1.tar.gz"
LICENSE="|| ( EPL-2.0 GPL-2-with-classpath-exception )"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/jaxb-api:2
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/rest-${PV}"

DOCS=( CONTRIBUTING.md NOTICE.md README.md )

JAVA_SRC_DIR="jaxrs-api/src/main/java"

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="jaxrs-api/src/test/java"

src_prepare() {
	use test && ver_test "$(java-config -g PROVIDES_VERSION)" -ge 9 && \
		eapply "${FILESDIR}/${P}-skip-test-on-java-9+.patch"
	java-pkg-2_src_prepare
}

src_install() {
	java-pkg-simple_src_install
	einstalldocs # https://bugs.gentoo.org/789582
}
