# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.eclipse.jetty:jetty-util:9.4.44.v20210927"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PV="${PV/_p/.v}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Utility classes for Jetty"
HOMEPAGE="https://www.eclipse.org/jetty"
SRC_URI="
	https://repo1.maven.org/maven2/org/eclipse/jetty/${PN}/${MY_PV}/${MY_P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/eclipse/jetty/${PN}/${MY_PV}/${MY_P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0 EPL-1.0"
SLOT="9"
KEYWORDS="~amd64"
# org/eclipse/jetty/version/build.properties is meant to be different
# for each build, but any discrepancy in this file will fail pkgdiff check
RESTRICT="test"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		>=dev-java/slf4j-api-1.7.28:0
		dev-java/tomcat-servlet-api:3.1
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="tomcat-servlet-api-3.1,slf4j-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_prepare() {
	default
	use binary && return

	sed -i -e "s/\${buildNumber}/1/g" \
		"${JAVA_SRC_DIR}/org/eclipse/jetty/version/build.properties" || \
		die "Failed to write build number to build properties"
	sed -i -e "s/\${timestamp}/$(date '+%s%N' | cut -b1-13))/g" \
		"${JAVA_SRC_DIR}/org/eclipse/jetty/version/build.properties" || \
		die "Failed to write build time to build properties"
	sed -i -e "s/\${project.version}/${PV}/g" \
		"${JAVA_SRC_DIR}/org/eclipse/jetty/version/build.properties" || \
		die "Failed to write project version to build properties"
	sed -i -e "s|\${project.scm.connection}|scm:git:https://github.com/eclipse/jetty.project.git/${PN}|g" \
		"${JAVA_SRC_DIR}/org/eclipse/jetty/version/build.properties" || \
		die "Failed to write project SCM URL to build properties"
}

src_compile() {
	java-pkg-simple_src_compile
	use binary && return

	# Add files included in the upstream's pre-built JAR
	pushd "${JAVA_SRC_DIR}" > /dev/null || die "Failed to enter JAVA_SRC_DIR"
	jar uf "${S}/${JAVA_JAR_FILENAME}" about.html || \
		die "Failed to add additional files to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
}
