# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /tmp/java-ebuilder/poms/javax.security.jacc-api-1.6.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/javax/security/jacc/javax.security.jacc-api/1.6/javax.security.jacc-api-1.6-sources.jar --binjar-uri https://repo1.maven.org/maven2/javax/security/jacc/javax.security.jacc-api/1.6/javax.security.jacc-api-1.6.jar --slot 0 --keywords "~amd64" --ebuild javax-security-jacc-api-1.6.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="javax.security.jacc:javax.security.jacc-api:1.6"
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

# Common dependencies
# POM: /tmp/java-ebuilder/poms/javax.security.jacc-api-${PV}.pom
# javax.servlet:javax.servlet-api:3.0.1 -> java-virtuals/servlet-api:4.0

CDEPEND="
	java-virtuals/servlet-api:4.0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="servlet-api-4.0"
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
