# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /tmp/java-ebuilder/poms/jetty-continuation-9.4.11.v20180605.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-continuation/9.4.11.v20180605/jetty-continuation-9.4.11.v20180605-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-continuation/9.4.11.v20180605/jetty-continuation-9.4.11.v20180605.jar --slot 9 --keywords "~amd64" --ebuild jetty-continuation-9.4.11_p20180605.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.eclipse.jetty:jetty-continuation:9.4.11.v20180605"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jetty Asynchronous API"
HOMEPAGE="https://www.eclipse.org/jetty"
SRC_URI="
	https://repo1.maven.org/maven2/org/eclipse/jetty/${PN}/9.4.11.v20180605/${PN}-9.4.11.v20180605-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/eclipse/jetty/${PN}/9.4.11.v20180605/${PN}-9.4.11.v20180605.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0 EPL-1.0"
SLOT="9"
KEYWORDS="~amd64"

# Compile dependencies
# POM: /tmp/java-ebuilder/poms/${PN}-9.4.11.v20180605.pom
# javax.servlet:javax.servlet-api:3.1.0 -> java-virtuals/servlet-api:3.1

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		java-virtuals/servlet-api:3.1
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="servlet-api-3.1"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_compile() {
	java-pkg-simple_src_compile
	use binary && return

	# Add files included in the upstream's pre-built JAR
	pushd "${JAVA_SRC_DIR}" > /dev/null || die "Failed to enter JAVA_SRC_DIR"
	jar uf "${S}/${JAVA_JAR_FILENAME}" about.html || \
		die "Failed to add additional files to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
}