# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="org.jetbrains.kotlin:${PN}:${PV}"

KOTLIN_LIBS_BINJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}.jar"
KOTLIN_LIBS_SRCJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}-sources.jar"

inherit kotlin-libs

KEYWORDS="~amd64"

DEPEND="!binary? ( ~dev-java/kotlin-core-builtins-${PV}:${SLOT} )"

JAVA_CLASSPATH_EXTRA="kotlin-core-builtins-${SLOT}"
JAVA_BINJAR_FILENAME="${P}.jar"

# Kotlin compiler needs not be called for this package

KOTLIN_LIBS_JAVAC_ARGS=(
	-g
	-sourcepath
	-proc:none
	-XDuseUnsharedTable=true
)
KOTLIN_LIBS_JAVA_SRC_DIR=( libraries/tools/kotlin-annotations-jvm/src )

src_compile() {
	if has binary ${JAVA_PKG_IUSE} && use binary; then
		kotlin-libs_src_compile
		return 0
	fi

	local target="target"
	local sources="sources.lst"
	mkdir -p "${target}" || die "Failed to create target directory"
	java-pkg_gen-cp JAVA_GENTOO_CLASSPATH
	local classpath=""
	java-pkg-simple_getclasspath

	find "${KOTLIN_LIBS_JAVA_SRC_DIR[@]}" -name "*.java" > "${sources}"
	ebegin "Compiling"
	$(java-pkg_get-javac) -d "${target}" -classpath ${classpath} \
		-source "${KOTLIN_LIBS_JAVA_WANT_SOURCE_TARGET}" \
		-target "${KOTLIN_LIBS_JAVA_WANT_SOURCE_TARGET}" \
		-encoding "${JAVA_ENCODING}" \
		"${KOTLIN_LIBS_JAVAC_ARGS[@]}" \
		"@${sources}" || die "Failed to compile Java sources"

	jar cf "${JAVA_JAR_FILENAME}" -C "${target}" . || die "jar failed"
}
