# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.glassfish.jersey.core:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

MY_PN="jersey"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Jersey core client implementation"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey"
# Need the JAR from Maven Central for source file
# org/glassfish/jersey/client/internal/LocalizationMessages.java
SRC_URI="
	https://github.com/eclipse-ee4j/jersey/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.tar.gz
	https://repo1.maven.org/maven2/org/glassfish/jersey/core/${PN}/${PV}/${P}-sources.jar
"
LICENSE="|| ( EPL-2.0 GPL-2-with-classpath-exception )"
SLOT="2"
KEYWORDS="~amd64"

CP_DEPEND="
	~dev-java/jersey-common-${PV}:2
	dev-java/jakarta-inject:0
	java-virtuals/ws-rs-api:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	dev-java/osgi-core:6
	test? (
		~dev-java/jersey-hk2-${PV}:2
		dev-java/hamcrest-library:1.3
		dev-java/jakarta-activation:1
		dev-java/mockito:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/${MY_P}/core-${PN#jersey-}"

JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=( "src/main/resources" )

JAVA_TEST_GENTOO_CLASSPATH="
	junit-4
	jersey-hk2-2
	hamcrest-library-1.3
	jakarta-activation-1
	mockito
"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS=( "src/test/resources" )

src_prepare() {
	cp "${WORKDIR}/org/glassfish/jersey/client/internal/LocalizationMessages.java" \
		"${JAVA_SRC_DIR}" || die "Failed to copy extra Java source file"
	java-pkg-2_src_prepare
	# Requires MockitoAnnotations.openMocks(Object),
	# which is not available in Mockito 1.9.5
	rm "${JAVA_TEST_SRC_DIR}/org/glassfish/jersey/client/ClientRequestTest.java" ||
		die "Failed to remove test class that cannot be compiled"
}
