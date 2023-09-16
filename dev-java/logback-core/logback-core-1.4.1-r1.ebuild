# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="ch.qos.logback:logback-core:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="logback-core module"
HOMEPAGE="https://logback.qos.ch"
SRC_URI="https://github.com/qos-ch/logback/archive/v_${PV}.tar.gz -> logback-${PV}.tar.gz"

LICENSE="EPL-1.0 LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/jakarta-mail:0
	dev-java/jakarta-mail-api:0
	dev-java/jakarta-servlet-api:6
	dev-java/janino:0
	dev-java/jansi:2
"

DEPEND="
	>=virtual/jdk-11:*
	${CP_DEPEND}
	test? (
		dev-java/assertj-core:3
		dev-java/mockito:4
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}"

S="${WORKDIR}/logback-v_${PV}/logback-core"

JAVA_SRC_DIR="src/main/java"

JAVA_TEST_GENTOO_CLASSPATH="junit-4,assertj-core-3,mockito-4"
JAVA_TEST_RESOURCE_DIRS="src/test/resources"
JAVA_TEST_SRC_DIR="src/test/java"

src_test() {
	# 83,88 logback-core/pom.xml
	# <excludes>
	#   <exclude>**/All*Test.java</exclude>
	#   <exclude>**/PackageTest.java</exclude>
	#   <!-- ConsoleAppenderTest redirects System.out which is not well tolerated by Maven -->
	#   <exclude>**/ConsoleAppenderTest.java</exclude>
	# </excludes>
	rm src/test/java/ch/qos/logback/core/appender/ConsoleAppenderTest.java || die
	pushd src/test/java || die
		local JAVA_TEST_RUN_ONLY=$(find * \
			-name "*Test.java" \
			! -wholename "**/All*Test.java" \
			! -wholename "**/PackageTest.java" \
			! -name "AbstractAppenderTest.java" \
			! -name "AbstractPatternLayoutBaseTest.java" \
			)
		JAVA_TEST_RUN_ONLY="${JAVA_TEST_RUN_ONLY//.java}"
		JAVA_TEST_RUN_ONLY="${JAVA_TEST_RUN_ONLY//\//.}"
	popd

	# accessible: module java.base does not "opens java.lang" to unnamed module @42bb2aee
	local vm_version="$(java-config -g PROVIDES_VERSION)"
	if [[ "${vm_version}" -ge 17 ]]; then
		JAVA_TEST_EXTRA_ARGS+=( --add-opens=java.base/java.lang=ALL-UNNAMED )
		JAVA_TEST_EXTRA_ARGS+=( --add-opens=java.base/java.io=ALL-UNNAMED )
	fi
	java-pkg-simple_src_test
}
