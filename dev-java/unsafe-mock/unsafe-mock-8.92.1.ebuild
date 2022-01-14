# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.headius:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A mock of sun.misc.Unsafe for building against"
HOMEPAGE="https://github.com/headius/unsafe-mock"
SRC_URI="
	https://github.com/headius/unsafe-mock/archive/refs/tags/${P}.tar.gz
	https://repo1.maven.org/maven2/com/headius/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="GPL-2-with-classpath-exception"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/unzip
"

# Depends on sun.reflect.Reflection, which is no longer available on Java 11
DEPEND="
	virtual/jdk:1.8
"

RDEPEND="
	virtual/jre:1.8
"

S="${WORKDIR}/${PN}-${P}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
