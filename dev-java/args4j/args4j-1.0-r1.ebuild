# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source binary test"
MAVEN_ID="args4j:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="args4j is a Java command line arguments parser"
HOMEPAGE="https://args4j.kohsuke.org/"
SRC_URI="
	https://repo1.maven.org/maven2/args4j/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/args4j/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}/${P}-RC"

JAVA_SRC_DIR="src"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_compile() {
	java-pkg-simple_src_compile
	use binary && return

	# Add files included in the upstream's pre-built JAR
	pushd "${JAVA_SRC_DIR}" > /dev/null || die "Failed to enter JAVA_SRC_DIR"
	jar uf "${S}/${JAVA_JAR_FILENAME}" org/kohsuke/args4j/Messages.properties ||
		die "Failed to add additional files to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
}
