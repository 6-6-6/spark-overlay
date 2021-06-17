# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit java-pkg-2

DESCRIPTION="Statically typed programming language for modern multiplatform applications"
HOMEPAGE="https://kotlinlang.org/"
SRC_URI="https://github.com/JetBrains/kotlin/releases/download/v${PV}/kotlin-compiler-${PV}.zip"

LICENSE="Apache-2.0 BSD MIT NPL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

KOTLIN_LIB_SLOT="${PV%.*}"

COMMON_DEPEND="
	dev-java/kotlin-common-bin:${KOTLIN_LIB_SLOT}
"
DEPEND="
	${COMMON_DEPEND}
	app-arch/unzip
"
RDEPEND="
	${COMMON_DEPEND}
	>=virtual/jdk-1.8
	>=virtual/jre-1.8
"

S="${WORKDIR}/kotlinc"

KOTLINC_LIBS="
	allopen-compiler-plugin.jar
	android-extensions-compiler.jar
	android-extensions-runtime.jar
	annotations-13.0.jar
	js.engines.jar
	jvm-abi-gen.jar
	kotlin-annotation-processing.jar
	kotlin-annotation-processing-cli.jar
	kotlin-annotation-processing-runtime.jar
	kotlin-ant.jar
	kotlin-compiler.jar
	kotlin-daemon-client.jar
	kotlin-daemon-client-new.jar
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
	kotlin-source-sections-compiler-plugin.jar
	kotlinx-serialization-compiler-plugin.jar
	mutability-annotations-compat.jar
	noarg-compiler-plugin.jar
	sam-with-receiver-compiler-plugin.jar
	trove4j.jar
"

src_install() {
	local kotlin_home="/usr/$(get_libdir)/${PN}"

	rm bin/*.bat || die
	into "${kotlin_home}"
	for exe in bin/*; do
		dobin "${exe}"
		dosym "../../${kotlin_home}/${exe}" "/usr/bin/$(basename ${exe})"
	done

	insinto "${kotlin_home}/lib"
	for jar in ${KOTLINC_LIBS}; do
		doins "${S}/lib/${jar}"
	done

	java-pkg_jar-from --into "${ED}/${kotlin_home}/lib" \
		"kotlin-common-bin-${KOTLIN_LIB_SLOT}"

	dodoc license/NOTICE.txt
}
