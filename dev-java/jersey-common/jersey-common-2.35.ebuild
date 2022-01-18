# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.glassfish.jersey.core:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple readme.gentoo-r1

MY_PN="jersey"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Jersey core common packages"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey"
# Need the JAR from Maven Central for source file
# org/glassfish/jersey/internal/LocalizationMessages.java
SRC_URI="
	https://github.com/eclipse-ee4j/jersey/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.tar.gz
	https://repo1.maven.org/maven2/org/glassfish/jersey/core/${PN}/${PV}/${P}-sources.jar
"
LICENSE="|| ( EPL-2.0 GPL-2-with-classpath-exception ) Apache-2.0 CC0-1.0"
SLOT="2"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/jakarta-annotation-api:0
	dev-java/jakarta-inject:0
	dev-java/osgi-resource-locator:0
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
		dev-java/hamcrest-library:1.3
		dev-java/mockito:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/${MY_P}/core-${PN#jersey-}"

JAVA_CLASSPATH_EXTRA="osgi-core-6"
JAVA_SRC_DIR=( "src/main/java" "src/main/jsr166" )
JAVA_RESOURCE_DIRS=( "src/main/resources" )

JAVA_TEST_GENTOO_CLASSPATH="
	junit-4
	hamcrest-library-1.3
	mockito
"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS=( "src/test/resources" )
JAVA_TEST_EXCLUDES=(
	# No runnable methods
	org.glassfish.jersey.internal.TestRuntimeDelegate
	# Failing tests
	org.glassfish.jersey.internal.config.ExternalPropertiesConfigurationFactoryTest
	# Failing tests skipped by upstream in pom.xml
	# https://github.com/eclipse-ee4j/jersey/blob/2.35/core-common/pom.xml#L681-L690
	org.glassfish.jersey.SecurityManagerConfiguredTest
	org.glassfish.jersey.internal.util.ReflectionHelperTest
)

MY_JAVA_TEST_POLICY="${JAVA_TEST_RESOURCE_DIRS[0]}/surefire.policy"
JAVA_TEST_EXTRA_ARGS=(
	# https://github.com/eclipse-ee4j/jersey/blob/2.35/core-common/pom.xml#L713
	-Djava.security.manager
	-Djava.security.policy="${MY_JAVA_TEST_POLICY}"
)

DOCS=( "${JAVA_RESOURCE_DIRS[0]}/META-INF/NOTICE.markdown" )

pkg_setup() {
	java-pkg-2_pkg_setup
	if ver_test "$(java-config -g PROVIDES_VERSION)" -ge 11; then
		MY_JAVA_VERSION="11"
		DOC_JAVA_VERSION=">=11"
		ALT_JAVA_VERSION="8"
	else
		MY_JAVA_VERSION="8"
		DOC_JAVA_VERSION="8"
		ALT_JAVA_VERSION=">=11"
	fi
	JAVA_SRC_DIR+=( "src/main/java${MY_JAVA_VERSION}" )
}

src_prepare() {
	cp "${WORKDIR}/org/glassfish/jersey/internal/LocalizationMessages.java" \
		"${JAVA_SRC_DIR[0]}" || die "Failed to copy extra Java source file"
	use test && eapply -p2 "${FILESDIR}/${P}-remove-unbuildable-tests.patch"
	java-pkg-2_src_prepare

	local build_properties="${JAVA_RESOURCE_DIRS[0]}/org/glassfish/jersey/internal/build.properties"
	sed -i -e "s/\${project.version}/${PV}/g" "${build_properties}" ||
		die "Failed to write project version to build.properties"
	sed -i -e "s/\${buildNumber}/$(date '+%F %T')/g" "${build_properties}" ||
		die "Failed to write project version to build.properties"

	if use test; then
		sed -i -e "s|\${java.home}|${JAVA_HOME}|g" \
			"${MY_JAVA_TEST_POLICY}" ||
			die "Failed to insert JAVA_HOME path into test policy file"
		sed -i -e "s|\${settings.localRepository}|${ESYSROOT}|g" \
			"${MY_JAVA_TEST_POLICY}" ||
			die "Failed to insert path to dependencies into test policy file"
		sed -i -e "s|\${project.build.directory}|${S}/target|g" \
			"${MY_JAVA_TEST_POLICY}" ||
			die "Failed to insert path to built classes into test policy file"
		sed -i -e "s|\${java.io.tmpdir}|${T}|g" \
			"${MY_JAVA_TEST_POLICY}" ||
			die "Failed to insert temp directory path into test policy file"
	fi
}

src_install() {
	DOC_CONTENTS="
This package follows the upstream to use different sources of Java
package org.glassfish.jersey.internal.jsr166 for Java 8 and Java >=11,
which means it may only support Java 8 OR Java >=11, but not both.
The JAR installed by this package on the system was built with and
is for Java ${DOC_JAVA_VERSION}.  This might cause runtime errors
if the JAR is used on JRE ${ALT_JAVA_VERSION}.\n
\n
Should any error occur after switching to JRE ${ALT_JAVA_VERSION},
please rebuild this package using JDK ${ALT_JAVA_VERSION}.
"

	java-pkg-simple_src_install
	einstalldocs # https://bugs.gentoo.org/789582
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
