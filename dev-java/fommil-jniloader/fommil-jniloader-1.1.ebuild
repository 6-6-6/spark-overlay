# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.github.fommil:jniloader:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN="jniloader"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Lightweight convenience library for loading JNI natives"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="
	https://repo1.maven.org/maven2/com/github/fommil/${MY_PN}/${PV}/${MY_P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/github/fommil/${MY_PN}/${PV}/${MY_P}.jar -> ${P}-bin.jar
"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		>=dev-java/lombok-1.16.16:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="lombok"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
