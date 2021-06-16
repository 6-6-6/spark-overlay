# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_PROVIDES="
	org.jetbrains.kotlin:kotlin-annotations-android:1.3.72
	org.jetbrains.kotlin:kotlin-annotations-jvm:1.3.72
	org.jetbrains.kotlin:kotlin-reflect:1.3.72
	org.jetbrains.kotlin:kotlin-stdlib:1.3.72
	org.jetbrains.kotlin:kotlin-stdlib-jdk7:1.3.72
	org.jetbrains.kotlin:kotlin-stdlib-jdk8:1.3.72
	org.jetbrains.kotlin:kotlin-stdlib-js:1.3.72
	org.jetbrains.kotlin:kotlin-test:1.3.72
	org.jetbrains.kotlin:kotlin-test-js:1.3.72
	org.jetbrains.kotlin:kotlin-test-junit:1.3.72
	org.jetbrains.kotlin:kotlin-test-junit5:1.3.72
	org.jetbrains.kotlin:kotlin-test-testng:1.3.72
"

inherit java-pkg-2

DESCRIPTION="Pseudo kotlin libs"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="https://github.com/JetBrains/kotlin/releases/download/v${PV}/kotlin-compiler-${PV}.zip"

LICENSE="Apache-2.0 BSD MIT NPL-1.1"
SLOT="0"
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
}
