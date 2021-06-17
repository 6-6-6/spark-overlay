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
	>=virtual/jre-1.8
"
BDEPEND="
	app-arch/unzip
"
DEPEND="
	>=virtual/jdk-1.8
"

S="${WORKDIR}/kotlinc"

src_install() {
	for maven_art in ${MAVEN_PROVIDES}; do
		local jar_name=$(cut -d ':' -f 2 <<< "${maven_art}")
		java-pkg_dojar "${S}/lib/${jar_name}.jar"
		if use source; then
			local src_jar="${S}/lib/${jar_name}-sources.jar"
			if [[ -f "${src_jar}" ]]; then
				insinto "${JAVA_PKG_SOURCESPATH}"
				doins "${src_jar}"
			fi
		fi
	done

	dodoc license/COPYRIGHT.txt
	dodoc license/LICENSE.txt
	dodoc license/README.md
}
