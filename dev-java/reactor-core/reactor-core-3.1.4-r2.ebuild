# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="io.projectreactor:reactor-core:3.1.4.RELEASE"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

KOTLIN_COMPAT=( kotlin1-{4..5} )

inherit java-pkg-2 java-pkg-simple java-pkg-maven kotlin-utils

DESCRIPTION="Non-Blocking Reactive Foundation for the JVM"
HOMEPAGE="https://github.com/reactor/reactor-core"
SRC_URI="
	https://repo1.maven.org/maven2/io/projectreactor/${PN}/${PV}.RELEASE/${P}.RELEASE-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/projectreactor/${PN}/${PV}.RELEASE/${P}.RELEASE.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

KOTLIN_LIBS='
	dev-java/kotlin-stdlib:${KOTLIN_SLOT_DEP}
'
KOTLIN_DEPEND="$(kotlin-utils_gen_slot_dep "${KOTLIN_LIBS}")"

CP_DEPEND="
	>=dev-java/reactive-streams-1.0.2:0
	>=dev-java/jsr305-3.0.2:0
	>=dev-java/slf4j-api-1.7.28:0
	dev-java/java9-concurrent-backport:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${KOTLIN_DEPEND}
		${CP_DEPEND}
		${KOTLIN_UTILS_DEPS}
		dev-java/jetbrains-annotations:13
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${KOTLIN_DEPEND}
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jetbrains-annotations-13"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

pkg_setup() {
	JAVA_GENTOO_CLASSPATH="$(kotlin-utils_gen_slot_cp "${KOTLIN_LIBS}")"
	java-pkg-2_pkg_setup
	! use binary && kotlin-utils_pkg_setup
}

src_prepare() {
	java-pkg-2_src_prepare

	sed -i "s/java.util.concurrent/java9.util.concurrent/"\
		"${S}"/${JAVA_SRC_DIR}/reactor/adapter/JdkFlowAdapter.java || die
}

src_compile() {
	java-pkg-simple_src_compile
	use binary && return
	kotlin-utils_src_compile
	kotlin-utils_jar
}
