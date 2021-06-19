# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jetbrains:annotations:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN="annotations"
MY_P=${MY_PN}-${PV}

DESCRIPTION="A set of annotations used for code inspection support and code documentation."
HOMEPAGE="https://github.com/JetBrains/java-annotations"
SRC_URI="https://repo.maven.apache.org/maven2/org/jetbrains/${MY_PN}/${PV}/${MY_P}-sources.jar -> ${P}-sources.jar
		https://repo.maven.apache.org/maven2/org/jetbrains/${MY_PN}/${PV}/${MY_P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
# For SLOT, please take the smallest version number for which the API is
# compatible with this version, and remove all trailing zero components
SLOT="13"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
