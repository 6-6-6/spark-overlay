# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="no.priv.garshol.duke:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A fast and flexible deduplication engine"
HOMEPAGE="https://github.com/larsga/Duke"
SRC_URI="https://github.com/larsga/Duke/archive/refs/tags/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/lucene:4.0
	dev-java/lucene-analyzers-common:4.0
	dev-java/lucene-spatial:4.0
	dev-java/mapdb:0.9.9
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	>=dev-java/commonj-1.1.1:0
	dev-java/tomcat-servlet-api:2.4
	test? (
		dev-java/h2:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/Duke-${P}"

JAVA_CLASSPATH_EXTRA="
	commonj
	tomcat-servlet-api-2.4
"
JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=( "src/main/resources" )

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS=( "src/test/resources" )
JAVA_TEST_EXCLUDES=(
	# Abstract classes, would cause InstantiationException
	no.priv.garshol.duke.test.ClassDatabaseTest
	no.priv.garshol.duke.test.DatabaseTest
	no.priv.garshol.duke.test.PersistentDatabaseTest
)

src_prepare() {
	java-pkg-2_src_prepare
	eapply "${FILESDIR}/${P}-fix-raw-type.patch"
	sed -i -e "s/\${project.version}/${PV}/g" \
		"src/main/resources/no/priv/garshol/duke/duke.properties" ||
		die "Failed to write project version to build properties"
	sed -i -e "s/\${buildNumber}/1 ($(date '+%F'))/g" \
		"src/main/resources/no/priv/garshol/duke/duke.properties" ||
		die "Failed to write build number to build properties"
	sed -i -e "s/\${user.name}/$(id -un)/g" \
		"src/main/resources/no/priv/garshol/duke/duke.properties" ||
		die "Failed to write builder's user name to build properties"
}

src_test() {
	# dev-java/h2 depends on dev-java/lucene:0, but this package depends on
	# dev-java/lucene:4.0, so including 'h2' in JAVA_TEST_GENTOO_CLASSPATH will
	# cause two versions of lucene to be added to the classpath, resulting in
	# compiler errors.  Therefore, we add h2's classpath without its
	# dependencies here.
	JAVA_GENTOO_CLASSPATH_EXTRA="$(java-pkg_getjars h2)"
	java-pkg-simple_src_test
}
