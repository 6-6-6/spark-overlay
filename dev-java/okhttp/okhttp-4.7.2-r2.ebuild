# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="com.squareup.okhttp3:okhttp:4.7.2"

KOTLIN_IUSE="source test"
KOTLIN_TESTING_FRAMEWORKS="junit-4"

KOTLIN_VERSIONS=">=1.4"
KOTLIN_VERSIONS_PREF_ORDER=( 1.{4..5} )

inherit kotlin

DESCRIPTION="Square's meticulous HTTP client for Java and Kotlin"
HOMEPAGE="https://square.github.io/okhttp/"
SRC_URI="https://github.com/square/okhttp/archive/refs/tags/parent-4.7.2.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Tests require Maven artifact:
# software.amazon.cryptools:AmazonCorrettoCryptoProvider:1.3.1
# Disable all tests until an ebuild for the artifact is available
RESTRICT="test"

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

S="${WORKDIR}/${PN}-parent-${PV}"

KOTLIN_KOTLINC_JAVA_OPTS="-Xmx512M"

JAVA_CLASSPATH_EXTRA="
	jetbrains-annotations-13
	animal-sniffer-annotations
"
JAVA_TEST_GENTOO_CLASSPATH="
	kotlin-test-1.4
	kotlin-test-junit-1.4
	assertj-core-2
"
JAVA_RESOURCE_DIRS=( "${PN}/src/main/resources" )

KOTLIN_SRC_DIR=(
	"${PN}/src/main/java-templates"
	"${PN}/src/main/kotlin"
)
KOTLIN_KOTLINC_ARGS=(
	-jvm-target 1.8
	-no-stdlib
	-Xallow-no-source-files
	-Xmulti-platform
)

KOTLIN_TEST_JAVA_SOURCE_ROOTS=( "${PN}/src/test/java" )
KOTLIN_TEST_SRC_DIR=( "${KOTLIN_TEST_JAVA_SOURCE_ROOTS[@]}" )
KOTLIN_TEST_KOTLINC_ARGS=(
	"${KOTLIN_KOTLINC_ARGS[@]}"
	-Xfriend-paths="${JAVA_JAR_FILENAME}"
)

src_prepare() {
	default

	sed -i -e "s/\$projectVersion/${PV}/g" \
		"${PN}/src/main/java-templates/okhttp3/OkHttp.kt" || \
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
		"$(find "okhttp-testing-support/src/main" -name "*.kt")"

	kotlin_src_test
}

src_install() {
	kotlin_src_install

	dodoc BUG-BOUNTY.md CHANGELOG.md README.md
	# releasing.md not relevant to users
	rm docs/release.md
	# security.md does not necessarily contain up-to-date information, which
	# might mislead users into thinking that the version they are using is
	# still supported
	rm docs/security.md
	dodoc docs/*.md
}
