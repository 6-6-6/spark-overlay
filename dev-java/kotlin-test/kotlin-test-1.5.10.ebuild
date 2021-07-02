# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="org.jetbrains.kotlin:${PN}:${PV}"

KOTLIN_LIBS_BINJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}.jar"
KOTLIN_LIBS_SRCJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}-sources.jar"

inherit kotlin-libs

KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

CP_DEPEND="
	~dev-java/kotlin-stdlib-${PV}:${SLOT}
"
DEPEND="
	${CP_DEPEND}
	!binary? (
		dev-java/jetbrains-annotations:13
	)
	test? (
		~dev-java/kotlin-test-annotations-common-${PV}:${SLOT}
		~dev-java/kotlin-test-junit-${PV}:${SLOT}
		dev-java/jetbrains-annotations:13
		dev-java/junit:4
	)
"
RDEPEND="${CP_DEPEND}"

JAVA_CLASSPATH_EXTRA="jetbrains-annotations-13"
JAVA_BINJAR_FILENAME="${P}.jar"

KOTLIN_LIBS_RUNTIME_COMPONENT="Test"
KOTLIN_LIBS_KOTLINC_ARGS=(
	-jvm-target 1.6
	-no-stdlib
	-Xallow-kotlin-package
	-Xallow-no-source-files
	-Xjvm-default=compatibility
	-Xmulti-platform
	-Xnormalize-constructor-calls=enable
	-Xopt-in=kotlin.RequiresOptIn
	-Xopt-in=kotlin.contracts.ExperimentalContracts
	-Xsuppress-deprecated-jvm-target-warning
	-Xuse-old-backend
)
KOTLIN_LIBS_COMMON_SOURCES_DIR=( libraries/kotlin.test/common/src/main/kotlin )
KOTLIN_LIBS_SRC_DIR=( libraries/kotlin.test/{common,jvm}/src/main/kotlin )

src_test() {
	kotlin-libs_src_test

	if use test; then
		local test_target="test-target"
		local CP="${JAVA_JAR_FILENAME}"
		CP="${CP}:$(java-pkg_getjars "kotlin-test-annotations-common-${SLOT}")"
		CP="${CP}:$(java-pkg_getjars "kotlin-test-junit-${SLOT}")"
		CP="${CP}:$(java-pkg_getjars "kotlin-stdlib-${SLOT}")"
		CP="${CP}:$(java-pkg_getjars jetbrains-annotations-13)"
		CP="${CP}:$(java-pkg_getjars junit-4)"
		KOTLIN_LIBS_COMMON_SOURCES_DIR=(
			libraries/kotlin.test/common/src/test/kotlin
		)
		KOTLIN_LIBS_KOTLINC_ARGS=(
			-jvm-target 1.6
			-no-stdlib
			-Xallow-kotlin-package
			-Xallow-no-source-files
			-Xfriend-paths="${JAVA_JAR_FILENAME}"
			-Xjvm-default=compatibility
			-Xopt-in=kotlin.RequiresOptIn
			-Xmulti-platform
			-Xsuppress-deprecated-jvm-target-warning
			-Xuse-old-backend
		)
		local test_sources=( $(find \
			libraries/kotlin.test/{jvm,common}/src/test/kotlin \
		-name "*.kt") )
		kotlin-libs_kotlinc -d "${test_target}" -classpath "${CP}" \
			"${test_sources[@]}"
		pushd "${test_target}" || die "Failed to enter test classes directory"
		local TESTS=$(find * -mindepth 2 -name "*.class" \
			-not -name "*\$*.class" -not -name "*Kt.class")
		TESTS="${TESTS//.class}"
		TESTS="${TESTS//\//.}"
		popd || die "Failed to exit test classes directory"
		ejunit4 -classpath "${test_target}:${CP}" ${TESTS}
	fi
}
