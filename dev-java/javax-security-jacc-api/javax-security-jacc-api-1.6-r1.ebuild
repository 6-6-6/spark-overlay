# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="javax.security.jacc:javax.security.jacc-api:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JACC API"
HOMEPAGE="https://jcp.org/en/jsr/detail?id=115"
SRC_URI="
	https://repo1.maven.org/maven2/javax/security/jacc/javax.security.jacc-api/${PV}/javax.security.jacc-api-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/javax/security/jacc/javax.security.jacc-api/${PV}/javax.security.jacc-api-${PV}.jar -> ${P}-bin.jar
"
LICENSE="CDDL GPL-2-with-classpath-exception"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/jakarta-servlet-api:4
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
	jar uf "${S}/${JAVA_JAR_FILENAME}" \
		doc-files javax/security/jacc/package.html || \
		die "Failed to add additional files to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
}
