# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MAVEN_ID="com.squareup.okhttp3:${PN}:${PV}"

KOTLIN_IUSE="source test"
KOTLIN_TESTING_FRAMEWORKS="junit-4"

KOTLIN_COMPAT=( kotlin1-{4..6} )

inherit kotlin

DESCRIPTION="Square's meticulous HTTP client for Java and Kotlin"
HOMEPAGE="https://square.github.io/okhttp/"
SRC_URI="https://github.com/square/okhttp/archive/refs/tags/parent-${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Tests require Maven artifact:
# software.amazon.cryptools:AmazonCorrettoCryptoProvider:1.3.1
# Disable all tests until an ebuild for the artifact is available
RESTRICT="test"

KOTLIN_LIBS='
	dev-java/kotlin-stdlib:${KOTLIN_SLOT_DEP}
'

KOTLIN_DEPEND="$(kotlin-utils_gen_slot_dep "${KOTLIN_LIBS}")"

CP_DEPEND="
	dev-java/okio:2.6
	dev-java/android-all:0
	>=dev-java/bctls-jdk15on-1.65:0
	dev-java/conscrypt-openjdk-uber:2.4
	dev-java/openjsse:1.1.0
"

DEPEND="
	>=virtual/jdk-1.8:*
	${KOTLIN_DEPEND}
	${CP_DEPEND}
	dev-java/jetbrains-annotations:13
	dev-java/animal-sniffer-annotations:0
	test? (
		$(kotlin-utils_gen_slot_dep '
			dev-java/kotlin-test-junit:${KOTLIN_SLOT_DEP}
		')
		dev-java/assertj-core:2
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${KOTLIN_DEPEND}
	${CP_DEPEND}
"

S="${WORKDIR}/${PN}-parent-${PV}"

KOTLIN_KOTLINC_JAVA_OPTS="-Xmx512M"

JAVA_CLASSPATH_EXTRA="
	jetbrains-annotations-13
	animal-sniffer-annotations
"
JAVA_TEST_GENTOO_CLASSPATH="
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

DOCS=( BUG-BOUNTY.md CHANGELOG.md README.md docs )

pkg_setup() {
	kotlin_pkg_setup
	JAVA_GENTOO_CLASSPATH="$(kotlin-utils_gen_slot_cp "${KOTLIN_LIBS}")"
	JAVA_TEST_GENTOO_CLASSPATH+=" $(kotlin-utils_gen_slot_cp '
		kotlin-test-junit-${KOTLIN_SLOT_DEP}
	')"
}

src_prepare() {
	default

	sed -i -e "s/\$projectVersion/${PV}/g" \
		"${PN}/src/main/java-templates/okhttp3/OkHttp.kt" || \
		die "Failed to substitute project version in source files"
}

src_test() {
	# Build the testing support library before testing
	local classpath=""
	# JAVA_GENTOO_CLASSPATH will be set by java-pkg_gen-cp,
	# which will be called during the src_compile phase
	classpath+="$(java-pkg_getjars --with-dependencies \
		"${JAVA_GENTOO_CLASSPATH}")"
	for package in ${JAVA_CLASSPATH_EXTRA} ${JAVA_TEST_GENTOO_CLASSPATH}; do
		classpath+=":$(java-pkg_getjars --with-dependencies "${package}")"
	done
	classpath+=":${KOTLIN_UTILS_CLASSES}"
	JAVA_GENTOO_CLASSPATH_EXTRA="${T}/okhttp-testing-support"
	kotlin-utils_kotlinc \
		-d "${JAVA_GENTOO_CLASSPATH_EXTRA}" \
		${classpath:+-classpath "${classpath}"} \
		$(find "okhttp-testing-support/src/main" -name "*.kt")

	kotlin_src_test
}

src_install() {
	# releasing.md not relevant to users
	rm docs/releasing.md || die "Failed to remove extraneous DOCS files"
	# security.md does not necessarily contain up-to-date information, which
	# might mislead users into thinking that the version they are using is
	# still supported
	rm docs/security.md || die "Failed to remove extraneous DOCS files"
	# CSS not needed
	rm -r docs/css || die "Failed to remove extraneous DOCS files"

	kotlin_src_install
}
