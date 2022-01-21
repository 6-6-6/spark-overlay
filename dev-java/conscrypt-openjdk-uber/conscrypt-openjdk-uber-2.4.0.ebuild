# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.conscrypt:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Conscrypt: OpenJDK UberJAR"
HOMEPAGE="https://conscrypt.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/conscrypt/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/conscrypt/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="2.4"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		dev-java/conscrypt-constants:${PV}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

BDEPEND="app-arch/unzip"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="conscrypt-constants-${PV}"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVADOC_ARGS="-source 8"

src_unpack() {
	java-pkg-maven_src_unpack
	! use binary && unpack "${JAVA_BINJAR_FILENAME}" # For conscrypt.properties
}

src_compile() {
	java-pkg-simple_src_compile
	use binary && return

	jar uf "${JAVA_JAR_FILENAME}" org/conscrypt/conscrypt.properties || \
		die "Failed to add conscrypt.properties to the JAR"
}
