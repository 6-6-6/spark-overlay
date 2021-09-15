# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="io.projectreactor:reactor-core:3.1.4.RELEASE"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

KOTLIN_VERSIONS=">=1.4"
KOTLIN_VERSIONS_PREF_ORDER=( 1.4 )

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

CP_DEPEND="
	>=dev-java/reactive-streams-1.0.2:0
	>=dev-java/jsr305-3.0.2:0
	dev-java/kotlin-stdlib:1.4
	>=dev-java/slf4j-api-1.7.28:0
	dev-java/java9-concurrent-backport:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CP_DEPEND}
		$(kotlin-utils_kotlin_depend)
		dev-java/jetbrains-annotations:13
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jetbrains-annotations-13"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

pkg_setup() {
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

	local classes="target/classes"

	# JAVA_GENTOO_CLASSPATH will be set by java-pkg_gen-cp,
	# which will be called by java-pkg-simple_src_compile
	local classpath="$(java-pkg_getjars --build-only --with-dependencies \
		"${JAVA_GENTOO_CLASSPATH},${JAVA_CLASSPATH_EXTRA}")"
	classpath+=":${classes}"

	local kotlin_sources="kotlin_sources.lst"
	find "${JAVA_SRC_DIR}" -name "*.kt" > "${kotlin_sources}"
	kotlin-utils_kotlinc -d "${classes}" ${classpath:+-classpath ${classpath}} \
		"@${kotlin_sources}"
	cat "${kotlin_sources}" >> sources.lst || \
		die "Failed to add Kotlin source file names to sources.lst"

	jar uf "${JAVA_JAR_FILENAME}" $(find "${classes}" -name "*Kt*.class") || \
		die "Failed to add Kotlin classes to the JAR"
}
