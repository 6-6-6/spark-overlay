# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="net.bytebuddy:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Java library for creating Java classes at run time"
HOMEPAGE="https://bytebuddy.net"
SRC_URI="
	https://repo1.maven.org/maven2/net/bytebuddy/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/net/bytebuddy/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="1.6"
KEYWORDS="~amd64"

# Lots of inconsistencies between generated JAR and pre-built JAR
RESTRICT="test"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		dev-java/findbugs-annotations:3
		dev-java/lombok-bin:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="
	findbugs-annotations-3
	lombok-bin
"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
