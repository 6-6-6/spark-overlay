# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="com.squareup.okio:okio:2.6.0"

KOTLIN_IUSE="test"
KOTLIN_TESTING_FRAMEWORKS="junit-4"

KOTLIN_VERSIONS=">=1.4"
KOTLIN_VERSIONS_PREF_ORDER=( 1.{4..5} )

inherit kotlin

DESCRIPTION="A modern I/O library for Android, Kotlin, and Java"
HOMEPAGE="https://square.github.io/okio/"
SRC_URI="https://github.com/square/${PN}/archive/refs/tags/parent-${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="2.6"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/kotlin-stdlib:1.4
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	dev-java/animal-sniffer-annotations:0
	dev-java/jetbrains-annotations:13
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

JAVA_CLASSPATH_EXTRA="
	animal-sniffer-annotations
	jetbrains-annotations-13
"
JAVA_TEST_GENTOO_CLASSPATH="
	kotlin-test-1.4
	kotlin-test-junit-1.4
	assertj-core-2
"
JAVA_RESOURCE_DIRS=( "${PN}/src/jvmMain/resources" )

KOTLIN_COMMON_SOURCES_DIR=( "${PN}/src/commonMain" )
KOTLIN_SRC_DIR=(
	"${PN}/src/jvmMain"
	"${KOTLIN_COMMON_SOURCES_DIR[@]}"
)
KOTLIN_KOTLINC_ARGS=(
	-no-stdlib
	-Xallow-no-source-files
	-Xmulti-platform
)

KOTLIN_TEST_JAVA_SOURCE_ROOTS=( "${PN}/src/jvmTest" )
KOTLIN_TEST_COMMON_SOURCES_DIR=( "${PN}/src/commonTest" )
KOTLIN_TEST_SRC_DIR=(
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

src_prepare() {
	if use test; then
		eapply "${FILESDIR}/${PN}-2.6.0-0001-skip-tests-not-run-by-upstream.patch"
		eapply "${FILESDIR}/${PN}-2.6.0-0002-skip-failing-tests-on-kotlin-1.4.32.patch"
	fi
	eapply_user
}

src_install() {
	kotlin_src_install
	dodoc BUG-BOUNTY.md CHANGELOG.md README.md docs/code_of_conduct.md
}
