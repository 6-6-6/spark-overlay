# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jetty-util-9.4.8.v20171121.pom --download-uri https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-util/9.4.8.v20171121/jetty-util-9.4.8.v20171121-sources.jar --slot 9 --keywords "~amd64" --ebuild jetty-util-9.4.8_p20171121-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.eclipse.jetty:jetty-util:9.4.8.v20171121"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Utility classes for Jetty"
HOMEPAGE="http://www.eclipse.org/jetty"
SRC_URI="https://repo1.maven.org/maven2/org/eclipse/jetty/${PN}/9.4.8.v20171121/${PN}-9.4.8.v20171121-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/eclipse/jetty/${PN}/9.4.8.v20171121/${PN}-9.4.8.v20171121.jar -> ${P}-bin.jar"
LICENSE="EPL-1.0 Apache-2.0"
SLOT="9"
KEYWORDS="~amd64"
# org/eclipse/jetty/version/build.properties is meant to be different
# for each build, but any discrepancy in this file will fail pkgdiff check
RESTRICT="test"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-9.4.8.v20171121.pom
# javax.servlet:javax.servlet-api:3.1.0 -> java-virtuals/servlet-api:3.1
# org.slf4j:slf4j-api:1.6.6 -> >=dev-java/slf4j-api-1.7.7:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		>=dev-java/slf4j-api-1.7.7:0
		java-virtuals/servlet-api:3.1
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="servlet-api-3.1,slf4j-api"
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
	jar uf "${S}/${JAVA_JAR_FILENAME}" about.html jetty-dir.css || \
		die "Failed to add additional files to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
}
