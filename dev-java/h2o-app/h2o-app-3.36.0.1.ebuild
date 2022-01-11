# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MAVEN_ID="ai.h2o:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple readme.gentoo-r1

DESCRIPTION="H2O Application Runner"
HOMEPAGE="https://www.h2o.ai/"
SRC_URI="
	https://github.com/h2oai/h2o-3/archive/refs/tags/jenkins-${PV}.tar.gz -> h2o-${PV}.tar.gz
	https://repo1.maven.org/maven2/ai/h2o/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"

CP_DEPEND="
	~dev-java/h2o-core-${PV}:${SLOT}
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/h2o-3-jenkins-${PV}/${PN}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

DOC_CONTENTS="
Since H2O 3.36, this package no longer registers 'water.H2OApp' as the
main class.  As a side effect, the '${PN}-${SLOT}' command is no longer
available.  Users are encouraged to install dev-java/h2o:${SLOT} and
use the 'h2o-${SLOT}' command to launch H2O ${SLOT}.
"

src_install() {
	java-pkg-simple_src_install
	readme.gentoo_create_doc
}

pkg_postinst() {
	FORCE_PRINT_ELOG=1
	# Print log upon first installation in this slot
	has_version "<${CATEGORY}/${PN}-${SLOT}" && \
		[[ -z "${REPLACING_VERSIONS}" ]] && readme.gentoo_print_elog
}
