# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_PROVIDES="
	org.jetbrains.kotlin:${PN}:${PV}
	org.jetbrains.kotlin:kotlin-stdlib-common:${PV}
"

KOTLIN_TASKS_BINJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}.jar"
KOTLIN_TASKS_SRCJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}-sources.jar"

inherit kotlin-tasks

KEYWORDS="~amd64"

DEPEND="!binary? (
	dev-java/kotlin-common-bin:${SLOT}
	dev-java/jetbrains-annotations:13
)"

JAVA_CLASSPATH_EXTRA="
	kotlin-common-bin-${SLOT}
	jetbrains-annotations-13
"
JAVA_BINJAR_FILENAME="${P}.jar"

src_compile() {
	KOTLIN_TASKS_KOTLINC_ARGS=(
		-jvm-target 1.6
		-no-stdlib
		-Xallow-kotlin-package
		-Xallow-no-source-files
		-Xallow-result-return-type
		-Xinline-classes
		-Xjvm-default=compatibility
		-Xmulti-platform
		-Xmultifile-parts-inherit
		-Xnormalize-constructor-calls=enable
		-Xopt-in=kotlin.RequiresOptIn
		-Xopt-in=kotlin.ExperimentalMultiplatform
		-Xopt-in=kotlin.contracts.ExperimentalContracts
		-Xsuppress-deprecated-jvm-target-warning
		-Xuse-14-inline-classes-mangling-scheme
		-Xuse-old-backend
	)
	KOTLIN_TASKS_JAVA_SOURCE_ROOTS=libraries/stdlib/jvm/src,libraries/stdlib/jvm/runtime
	local common_sources=( $(\
		find libraries/stdlib/{,common,unsigned}/src -name "*.kt") )
	OLD_IFS="${IFS}"
	IFS=','
	KOTLIN_TASKS_COMMON_SOURCES="${common_sources[*]}"
	IFS="${OLD_IFS}"
	KOTLIN_TASKS_SOURCES=$(find \
		core/builtins/src \
		libraries/stdlib/jvm/runtime \
		libraries/stdlib/{jvm,common,,unsigned}/src \
		-name "*.kt")
	kotlin-tasks_src_compile
}
