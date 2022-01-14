# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.sun.mail:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jakarta Mail API (no providers)"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.mail"
SRC_URI="
	https://repo1.maven.org/maven2/com/sun/mail/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/sun/mail/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="|| ( EPL-2.0 GPL-2-with-classpath-exception )"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/jakarta-activation-api:1
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

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_compile() {
	java-pkg-simple_src_compile
	use binary && return

	# Add files included in the upstream's pre-built JAR
	pushd "${JAVA_SRC_DIR}" > /dev/null || die "Failed to enter JAVA_SRC_DIR"
	jar uf "${S}/${JAVA_JAR_FILENAME}" overview.html doc-files ||
		die "Failed to add additional files to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
}
