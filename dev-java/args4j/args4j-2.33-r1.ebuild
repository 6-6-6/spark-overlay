# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Binary JAR contains Java sources, which we should
# never add, so pkgdiff would always fail
JAVA_PKG_IUSE="doc source binary"
MAVEN_ID="args4j:${PN}:${PV}"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="args4j is a Java command line arguments parser"
HOMEPAGE="https://args4j.kohsuke.org/"
SRC_URI="
	https://repo1.maven.org/maven2/args4j/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/args4j/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"

LICENSE="MIT"
SLOT="2"
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

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
