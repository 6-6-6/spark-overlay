# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-pkg-2 kotlin-compiler optfeature

DESCRIPTION="Statically typed programming language for modern multiplatform applications"
HOMEPAGE="https://kotlinlang.org/"
SRC_URI="https://github.com/JetBrains/kotlin/releases/download/v${PV}/kotlin-compiler-${PV}.zip"

LICENSE="Apache-2.0 BSD MIT NPL-1.1"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"

COROUTINES_CORE_SLOT="1.3.8"
JB_ANNOTATIONS_SLOT="13"

BDEPEND="
	app-arch/unzip
"

# The atom for each bootstrap package should be put before the atom for the
# normal package, so it will be selected if neither package has been installed
# (this holds at least on Portage 3.0.30), thus users need not manually install
# those normal packages with USE="binary" and can directly install this package
DEPEND="
	>=virtual/jdk-1.8:*
	|| (
		~dev-java/kotlin-stdlib-bootstrap-${PV}:${SLOT}
		~dev-java/kotlin-stdlib-${PV}:${SLOT}
	)
	|| (
		~dev-java/kotlin-reflect-bootstrap-${PV}:${SLOT}
		~dev-java/kotlin-reflect-${PV}:${SLOT}
	)
	dev-java/kotlinx-coroutines-core-bin:${COROUTINES_CORE_SLOT}
	dev-java/jetbrains-annotations:${JB_ANNOTATIONS_SLOT}
	dev-java/jetbrains-trove:0
"

RDEPEND="
	${DEPEND}
"

S="${WORKDIR}/kotlinc"

KOTLIN_COMPILER_HOME="/opt/${PN}-${SLOT}"

KOTLINC_LIBS=(
	allopen-compiler-plugin.jar
	android-extensions-compiler.jar
	android-extensions-runtime.jar
	js.engines.jar
	jvm-abi-gen.jar
	kotlin-annotation-processing.jar
	kotlin-annotation-processing-cli.jar
	kotlin-annotation-processing-runtime.jar
	kotlin-ant.jar
	kotlin-compiler.jar
	kotlin-daemon-client.jar
	kotlin-daemon.jar
	kotlin-imports-dumper-compiler-plugin.jar
	kotlin-main-kts.jar
	kotlin-preloader.jar
	kotlin-runner.jar
	kotlin-scripting-common.jar
	kotlin-scripting-compiler-impl.jar
	kotlin-scripting-compiler.jar
	kotlin-scripting-js.jar
	kotlin-scripting-jvm.jar
	kotlin-script-runtime.jar
	kotlinx-serialization-compiler-plugin.jar
	mutability-annotations-compat.jar
	noarg-compiler-plugin.jar
	parcelize-compiler.jar
	parcelize-runtime.jar
	sam-with-receiver-compiler-plugin.jar
)

src_compile() {
	KOTLINC_BIN_TMP="${T}/bin"
	mkdir "${KOTLINC_BIN_TMP}" ||
		die "Failed to create directory for executables"
	rm bin/*.bat || die "Failed to remove extraneous executables"
	cp bin/* "${KOTLINC_BIN_TMP}" || die "Failed to copy executables"

	KOTLINC_LIB_TMP="${T}/lib"
	mkdir "${KOTLINC_LIB_TMP}" ||
		die "Failed to create directory for libraries"
	cp "${KOTLINC_LIBS[@]/#/lib/}" "${KOTLINC_LIB_TMP}" ||
		die "Failed to copy libraries"

	# Create symbolic links to required Kotlin core library components
	ln -s "${EPREFIX}/usr/share/kotlin-stdlib-${SLOT}/lib/kotlin-stdlib.jar" \
		"${KOTLINC_LIB_TMP}/kotlin-stdlib.jar" ||
		die "Failed to create symbolic link to kotlin-stdlib.jar"
	ln -s "${EPREFIX}/usr/share/kotlin-reflect-${SLOT}/lib/kotlin-reflect.jar" \
		"${KOTLINC_LIB_TMP}/kotlin-reflect.jar" ||
		die "Failed to create symbolic link to kotlin-reflect.jar"

	# Create symbolic links to external dependencies
	java-pkg_jar-from --into "${KOTLINC_LIB_TMP}" \
		"kotlinx-coroutines-core-bin-${COROUTINES_CORE_SLOT}" \
		kotlinx-coroutines-core-bin.jar kotlinx-coroutines-core.jar
	java-pkg_jar-from --into "${KOTLINC_LIB_TMP}" \
		"jetbrains-annotations-${JB_ANNOTATIONS_SLOT}" \
		jetbrains-annotations.jar annotations-13.0.jar
	java-pkg_jar-from --into "${KOTLINC_LIB_TMP}" \
		"jetbrains-trove" \
		jetbrains-trove.jar trove4j.jar
}

src_install() {
	exeinto "${KOTLIN_COMPILER_HOME}/bin"
	doexe "${KOTLINC_BIN_TMP}"/*

	insinto "${KOTLIN_COMPILER_HOME}/lib"
	doins "${KOTLINC_LIB_TMP}"/*

	# Remove redundant copy of Apache-2.0 license
	rm license/LICENSE.txt ||
		die "Failed to remove extraneous documentation file"
	dodoc -r license/*

	# build.txt required for 'kotlin -version'
	insinto "${KOTLIN_COMPILER_HOME}"
	doins build.txt
}

pkg_postinst() {
	kotlin-compiler_pkg_postinst
	optfeature "compiling for the Kotlin/JS platform" \
		"dev-java/kotlin-stdlib-js:${SLOT}"
}
