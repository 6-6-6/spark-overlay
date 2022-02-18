# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MAVEN_ID="org.jetbrains.kotlin:${PN}:${PV}"

KOTLIN_LIBS_BINJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}.jar"
KOTLIN_LIBS_SRCJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}-sources.jar"

inherit kotlin-libs

DESCRIPTION="Kotlin annotations for JVM"
KEYWORDS="~amd64"

JAVA_BINJAR_FILENAME="${P}.jar"
KOTLIN_LIBS_SRCJAR_FILENAME="${P}-sources.jar"

# Kotlin compiler needs not be called for this package

JAVAC_ARGS="-g -proc:none -XDuseUnsharedTable=true"
JAVAC_ARGS+=" -Xlint:deprecation -Xlint:unchecked"
JAVA_SRC_DIR=( libraries/tools/kotlin-annotations-jvm/src )

src_compile() {
	# On JDK 11 or above, there will be a "bootstrap class path not set in
	# conjunction with -source 8" warning, which is expected within Portage
	if [[ "$(java-config -g PROVIDES_VERSION)" == 1.8 ]]; then
		JAVAC_ARGS+=" -Werror"
	fi
	java-pkg-simple_src_compile
}
