# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.glassfish.jersey.media:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

MY_PN="jersey"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Jersey Server Sent Events entity providers support module"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey"
# Need the JAR from Maven Central for source file
# org/glassfish/jersey/media/sse/LocalizationMessages.java
SRC_URI="
	https://github.com/eclipse-ee4j/jersey/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.tar.gz
	https://repo1.maven.org/maven2/org/glassfish/jersey/media/${PN}/${PV}/${P}-sources.jar
"
LICENSE="|| ( EPL-2.0 GPL-2-with-classpath-exception )"
SLOT="2"
KEYWORDS="~amd64"

# Tests require
# org.glassfish.jersey.test-framework.providers:jersey-test-framework-provider-bundle:2.35,
# which is not packaged yet and has about 100 dependencies
RESTRICT="test"

CP_DEPEND="
	~dev-java/jersey-server-${PV}:2
	dev-java/jakarta-inject:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/${MY_P}/media/${PN#jersey-media-}"

JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=( "src/main/resources" )

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"

src_prepare() {
	cp "${WORKDIR}/org/glassfish/jersey/media/sse/LocalizationMessages.java" \
		"${JAVA_SRC_DIR}" || die "Failed to copy extra Java source file"
	java-pkg-2_src_prepare
}
