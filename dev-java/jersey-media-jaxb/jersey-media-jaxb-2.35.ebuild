# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.glassfish.jersey.media:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

MY_PN="jersey"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="JAX-RS features based upon JAX-B"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey"
# Need the JAR from Maven Central for source file
# org/glassfish/jersey/jaxb/internal/LocalizationMessages.java
SRC_URI="
	https://github.com/eclipse-ee4j/jersey/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.tar.gz
	https://repo1.maven.org/maven2/org/glassfish/jersey/media/${PN}/${PV}/${P}-sources.jar
"
LICENSE="|| ( EPL-2.0 GPL-2-with-classpath-exception )"
SLOT="2"
KEYWORDS="~amd64"

CP_DEPEND="
	~dev-java/jersey-common-${PV}:2
	dev-java/jakarta-inject:0
	dev-java/osgi-resource-locator:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	dev-java/jaxb-api:2
	test? (
		~dev-java/jersey-hk2-${PV}:2
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/${MY_P}/media/${PN#jersey-media-}"

JAVA_CLASSPATH_EXTRA="jaxb-api-2"
JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=( "src/main/resources" )

JAVA_TEST_GENTOO_CLASSPATH="
	junit-4
	jersey-hk2-2
"
JAVA_TEST_SRC_DIR="src/test/java"

src_prepare() {
	cp "${WORKDIR}/org/glassfish/jersey/jaxb/internal/LocalizationMessages.java" \
		"${JAVA_SRC_DIR}" || die "Failed to copy extra Java source file"
	# Ignore test that requires an extra package on Java 11+
	use test && ver_test "$(java-config -g PROVIDES_VERSION)" -ge 11 && \
		eapply -p3 "${FILESDIR}/${P}-ignore-test-with-unavailable-dep.patch"
	java-pkg-2_src_prepare
}
