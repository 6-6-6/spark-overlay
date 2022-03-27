# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MAVEN_ID="com.fasterxml.jackson.module:${PN}_2.12:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven java-pkg-simple-plugins

DESCRIPTION="Jackson Module for Scala"
HOMEPAGE="https://github.com/FasterXML/jackson-module-scala"
SRC_URI="
	https://repo1.maven.org/maven2/com/fasterxml/jackson/module/${PN}_2.12/${PV}/${PN}_2.12-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/fasterxml/jackson/module/${PN}_2.12/${PV}/${PN}_2.12-${PV}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="2.12"
KEYWORDS="~amd64"

# This package can be compiled from source, but doing so would cause a runtime
# error when Spark is run
IUSE="+binary"

CP_DEPEND="
	>=dev-java/jackson-core-${PV}:0
	>=dev-java/jackson-annotations-${PV}:2
	>=dev-java/jackson-databind-${PV}:0
	>=dev-java/jackson-module-paranamer-${PV}:0
	dev-lang/scala:2.12
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_compile() {
	java-pkg-simple-plugins_src_compile
}
