# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MAVEN_ID="com.squareup.okio:${PN}:${PV}"

KOTLIN_IUSE="source test"
KOTLIN_TESTING_FRAMEWORKS="junit-4"

KOTLIN_COMPAT=( kotlin1-{4..6} )

inherit kotlin

DESCRIPTION="A modern I/O library for Android, Kotlin, and Java"
HOMEPAGE="https://square.github.io/okio/"
SRC_URI="https://github.com/square/${PN}/archive/refs/tags/parent-${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="2.6"
KEYWORDS="~amd64"

KOTLIN_LIBS='
	dev-java/kotlin-stdlib:${KOTLIN_SLOT_DEP}
'

KOTLIN_DEPEND="$(kotlin-utils_gen_slot_dep "${KOTLIN_LIBS}")"

DEPEND="
	>=virtual/jdk-1.8:*
	${KOTLIN_DEPEND}
	dev-java/animal-sniffer-annotations:0
	dev-java/jetbrains-annotations:13
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
"

S="${WORKDIR}/${PN}-parent-${PV}"

JAVA_CLASSPATH_EXTRA="
	animal-sniffer-annotations
	jetbrains-annotations-13
"
JAVA_TEST_GENTOO_CLASSPATH="
	assertj-core-2
"
JAVA_RESOURCE_DIRS=( "${PN}/src/jvmMain/resources" )

KOTLIN_COMMON_SOURCES_DIR=( "${PN}/src/commonMain/kotlin" )
KOTLIN_SRC_DIR=(
	"${PN}/src/jvmMain/kotlin"
	"${KOTLIN_COMMON_SOURCES_DIR[@]}"
)
KOTLIN_KOTLINC_ARGS=(
	-no-stdlib
	-Xallow-no-source-files
	-Xmulti-platform
)

KOTLIN_TEST_JAVA_SOURCE_ROOTS=( "${PN}/src/jvmTest/java" )
KOTLIN_TEST_COMMON_SOURCES_DIR=( "${PN}/src/commonTest/kotlin" )
KOTLIN_TEST_SRC_DIR=(
	"${PN}/src/jvmTest/kotlin"
	"${KOTLIN_TEST_JAVA_SOURCE_ROOTS[@]}"
	"${KOTLIN_TEST_COMMON_SOURCES_DIR[@]}"
)
KOTLIN_TEST_KOTLINC_ARGS=(
	"${KOTLIN_KOTLINC_ARGS[@]}"
	-Xfriend-paths="${JAVA_JAR_FILENAME}"
)
KOTLIN_TEST_JAVA_WANT_SOURCE_TARGET="1.7"
KOTLIN_TEST_EXCLUDES=(
	# Non-tests
	okio.TestUtil
)

DOCS=( BUG-BOUNTY.md CHANGELOG.md README.md docs/code_of_conduct.md )

pkg_setup() {
	kotlin_pkg_setup
	JAVA_GENTOO_CLASSPATH="$(kotlin-utils_gen_slot_cp "${KOTLIN_LIBS}")"
	JAVA_TEST_GENTOO_CLASSPATH+=" $(kotlin-utils_gen_slot_cp '
		kotlin-test-junit-${KOTLIN_SLOT_DEP}
	')"
}

src_prepare() {
	if use test; then
		eapply "${FILESDIR}/${PN}-2.6.0-0001-skip-tests-not-run-by-upstream.patch"
		eapply "${FILESDIR}/${PN}-2.6.0-0002-skip-failing-tests-on-kotlin-1.4.32.patch"
	fi
	eapply_user
}
