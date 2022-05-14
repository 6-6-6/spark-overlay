# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.glassfish.jersey.core:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

MY_PN="jersey"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Jersey core server implementation"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey"
# Need the JAR from Maven Central for source file
# org/glassfish/jersey/server/internal/LocalizationMessages.java
SRC_URI="
	https://github.com/eclipse-ee4j/jersey/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.tar.gz
	https://repo1.maven.org/maven2/org/glassfish/jersey/core/${PN}/${PV}/${P}-sources.jar
"
LICENSE="|| ( EPL-2.0 GPL-2-with-classpath-exception ) Apache-2.0 BSD W3C"
SLOT="2"
KEYWORDS="~amd64"

# Tests require org.jboss:jboss-vfs, which is not packaged yet
RESTRICT="test"

CP_DEPEND="
	~dev-java/jersey-client-${PV}:2
	~dev-java/jersey-common-${PV}:2
	~dev-java/jersey-media-jaxb-${PV}:2
	dev-java/jakarta-annotation-api:0
	dev-java/validation-api:2.0
	java-virtuals/ws-rs-api:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	dev-java/jaxb-api:2
	dev-java/osgi-core:6
	test? (
		~dev-java/jersey-hk2-${PV}:2
		~dev-java/jersey-media-jaxb-${PV}:2
		dev-java/hamcrest-library:1.3
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/${MY_P}/core-${PN#jersey-}"

JAVA_CLASSPATH_EXTRA="
	jaxb-api-2
	osgi-core-6
"
JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=( "src/main/resources" )

JAVA_TEST_GENTOO_CLASSPATH="
	junit-4
	jersey-hk2-2
	jersey-media-jaxb-2
	hamcrest-library-1.3
"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS=( "src/test/resources" )

DOCS=( "${JAVA_RESOURCE_DIRS[0]}/META-INF/NOTICE.markdown" )

src_prepare() {
	cp "${WORKDIR}/org/glassfish/jersey/server/internal/LocalizationMessages.java" \
		"${JAVA_SRC_DIR}" || die "Failed to copy extra Java source file"
	java-pkg-2_src_prepare
}

src_install() {
	java-pkg-simple_src_install
	einstalldocs # https://bugs.gentoo.org/789582
}
