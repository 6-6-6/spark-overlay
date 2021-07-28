# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_PROVIDES="
	javax.xml.rpc:javax.xml.rpc-api:1.1.2
	javax.xml:jaxrpc-api:1.1
"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Java APIs for XML based RPC"
HOMEPAGE="http://java.net/javax.xml.rpc-api/"
SRC_URI="
	https://repo1.maven.org/maven2/javax/xml/rpc/javax.xml.rpc-api/${PV}/javax.xml.rpc-api-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/javax/xml/rpc/javax.xml.rpc-api/${PV}/javax.xml.rpc-api-${PV}.jar -> ${P}-bin.jar
"
LICENSE="CDDL GPL-2-with-classpath-exception"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /tmp/java-ebuilder/poms/javax.xml.rpc-api-${PV}.pom
# javax.servlet:javax.servlet-api:4.0.0 -> java-virtuals/servlet-api:4.0

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
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="servlet-api-4.0"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_compile() {
	java-pkg-simple_src_compile

	# Some HTML files are included in the upstream JAR
	pushd "${JAVA_SRC_DIR}" > /dev/null || die "Failed to enter JAVA_SRC_DIR"
	jar uf "${S}/${JAVA_JAR_FILENAME}" $(find * -name "*.html") || \
		die "Failed to add HTML files to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
}
