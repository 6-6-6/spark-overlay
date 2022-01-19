# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.glassfish.jersey.inject:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

MY_PN="jersey"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="HK2 InjectionManager implementation"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey"
# Need the JAR from Maven Central for source file
# org/glassfish/jersey/inject/hk2/LocalizationMessages.java
SRC_URI="
	https://github.com/eclipse-ee4j/jersey/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.tar.gz
	https://repo1.maven.org/maven2/org/glassfish/jersey/inject/${PN}/${PV}/${P}-sources.jar
"
LICENSE="|| ( EPL-2.0 GPL-2-with-classpath-exception )"
SLOT="2"
KEYWORDS="~amd64"

CP_DEPEND="
	~dev-java/jersey-common-${PV}:2
	dev-java/hk2-locator:0
	dev-java/javassist:3
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	test? (
		dev-java/hamcrest-library:1.3
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/${MY_P}/inject/${PN#jersey-}"

JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=( "src/main/resources" )

JAVA_TEST_GENTOO_CLASSPATH="
	junit-4
	hamcrest-library-1.3
"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_EXCLUDES=(
	# No runnable methods
	org.glassfish.jersey.inject.hk2.TestSuppliers
)

src_prepare() {
	cp "${WORKDIR}/org/glassfish/jersey/inject/hk2/LocalizationMessages.java" \
		"${JAVA_SRC_DIR}" || die "Failed to copy extra Java source file"
	java-pkg-2_src_prepare
}
