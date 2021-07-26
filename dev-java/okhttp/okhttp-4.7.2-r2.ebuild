# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="com.squareup.okhttp3:okhttp:4.7.2"

KOTLIN_IUSE="test"
KOTLIN_TESTING_FRAMEWORKS="junit-4"

inherit kotlin

DESCRIPTION="Square's meticulous HTTP client for Java and Kotlin"
HOMEPAGE="https://square.github.io/okhttp/"
SRC_URI="
	https://github.com/square/okhttp/archive/refs/tags/parent-4.7.2.tar.gz -> ${P}.tar.gz
	https://repo1.maven.org/maven2/com/squareup/${PN}3/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Tests require Maven artifact:
# software.amazon.cryptools:AmazonCorrettoCryptoProvider:1.3.1
# Disable all tests until an ebuild for the artifact is available
RESTRICT="test"

KOTLIN_VERSIONS=">=1.4"
KOTLIN_VERSIONS_PREF_ORDER=( 1.{4..5} )

CP_DEPEND="
	dev-java/kotlin-stdlib:1.4
	dev-java/okio:2.6
	dev-java/android-all:0
	>=dev-java/bctls-jdk15on-1.65:0
	dev-java/conscrypt-openjdk-uber:2.4
	dev-java/openjsse:1.1.0
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	dev-java/jetbrains-annotations:13
	dev-java/animal-sniffer-annotations:0
	test? (
		dev-java/kotlin-test:1.4
		dev-java/kotlin-test-junit:1.4
		dev-java/assertj-core:2
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/${PN}-parent-${PV}/${PN}"

KOTLIN_KOTLINC_JAVA_OPTS="-Xmx512M"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_CLASSPATH_EXTRA="
	jetbrains-annotations-13
	animal-sniffer-annotations
"
JAVA_TEST_GENTOO_CLASSPATH="
	kotlin-test-1.4
	kotlin-test-junit-1.4
	assertj-core-2
"
JAVA_RESOURCE_DIRS=( src/main/resources )

KOTLIN_SRC_DIR=(
	src/main/java-templates
	src/main/kotlin
)
KOTLIN_KOTLINC_ARGS=(
	-jvm-target 1.8
	-no-stdlib
	-Xallow-no-source-files
	-Xmulti-platform
)

KOTLIN_TEST_JAVA_SOURCE_ROOTS=( src/test/java )
KOTLIN_TEST_SRC_DIR=( "${KOTLIN_TEST_JAVA_SOURCE_ROOTS[@]}" )
KOTLIN_TEST_KOTLINC_ARGS=(
	"${KOTLIN_KOTLINC_ARGS[@]}"
	-Xfriend-paths="${JAVA_JAR_FILENAME}"
)

src_prepare() {
	default

	sed -i -e "s/\$projectVersion/${PV}/g" \
		src/main/java-templates/okhttp3/OkHttp.kt || \
		die "Failed to substitute project version in source files"
}

src_test() {
	# Build the testing support library before testing
	local classpath=""
	java-pkg-simple_getclasspath
	classpath+=":${KOTLIN_UTILS_CLASSES}"
	for package in ${JAVA_TEST_GENTOO_CLASSPATH}; do
		classpath+=":$(java-pkg_getjars --with-dependencies "${package}")"
	done
	JAVA_GENTOO_CLASSPATH_EXTRA="${T}/okhttp-testing-support"
	kotlin-utils_kotlinc \
		-d "${JAVA_GENTOO_CLASSPATH_EXTRA}" \
		${classpath:+-classpath ${classpath}} \
		"$(find "../okhttp-testing-support/src/main" -name "*.kt")"

	kotlin-src_test
}
