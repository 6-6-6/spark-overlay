# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="source"

# During a version bump, please check if any artifact listed here has been
# removed and if any new artifacts for Kotlin core libraries have been added,
# then update the value of MAVEN_PROVIDES accordingly if necessary
MAVEN_PROVIDES="
	org.jetbrains.kotlin:kotlin-annotations-android:${PV}
	org.jetbrains.kotlin:kotlin-annotations-jvm:${PV}
	org.jetbrains.kotlin:kotlin-reflect:${PV}
	org.jetbrains.kotlin:kotlin-stdlib:${PV}
	org.jetbrains.kotlin:kotlin-stdlib-jdk7:${PV}
	org.jetbrains.kotlin:kotlin-stdlib-jdk8:${PV}
	org.jetbrains.kotlin:kotlin-stdlib-js:${PV}
	org.jetbrains.kotlin:kotlin-test:${PV}
	org.jetbrains.kotlin:kotlin-test-js:${PV}
	org.jetbrains.kotlin:kotlin-test-junit:${PV}
	org.jetbrains.kotlin:kotlin-test-junit5:${PV}
	org.jetbrains.kotlin:kotlin-test-testng:${PV}
"

inherit java-pkg-2

DESCRIPTION="Kotlin Common Libraries"
HOMEPAGE="https://kotlinlang.org/"
SRC_URI="https://github.com/JetBrains/kotlin/releases/download/v${PV}/kotlin-compiler-${PV}.zip"

LICENSE="Apache-2.0 BSD MIT NPL-1.1"
SLOT="${PV%.*}"
KEYWORDS="~amd64 ~x86"

IUSE=""

RDEPEND="
	>=virtual/jre-1.8:*
"
BDEPEND="
	app-arch/unzip
"
# Binary package, permitted to use JRE in DEPEND
DEPEND="${RDEPEND}"

S="${WORKDIR}/kotlinc"

src_prepare() {
	java-pkg-2_src_prepare

	local artifact_ids=( $(cut -d ':' -f 2 <<< "${MAVEN_PROVIDES}" || die) )
	# An array of Kotlin library JAR file names for subsequent phases
	KOTLIN_LIBS=( ${artifact_ids[@]/%/.jar} )

	KOTLIN_LIB_TMP="${T}/lib"
	mkdir "${KOTLIN_LIB_TMP}" || die
	cp "${KOTLIN_LIBS[@]/#/lib/}" "${KOTLIN_LIB_TMP}" || die
}

src_install() {
	java-pkg_jarinto "/opt/${PN}-${SLOT}/lib"
	java-pkg_dojar "${KOTLIN_LIB_TMP}"/*
	if use source; then
		for jar_name in "${KOTLIN_LIBS[@]/%.jar/}"; do
			local src_jar="lib/${jar_name}-sources.jar"
			if [[ -f "${src_jar}" ]]; then
				insinto "${JAVA_PKG_SOURCESPATH}"
				doins "${src_jar}"
			fi
		done
	fi

	dodoc license/COPYRIGHT.txt
	dodoc license/LICENSE.txt
	dodoc license/README.md
}
