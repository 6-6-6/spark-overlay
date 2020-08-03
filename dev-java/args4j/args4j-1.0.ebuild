# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/args4j-1.0.pom --download-uri https://repo1.maven.org/maven2/args4j/args4j/1.0/args4j-1.0-sources.jar --slot 1 --keywords "~amd64" --ebuild args4j-1.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary test"
MAVEN_ID="args4j:args4j:1.0"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="args4j is a small Java class library that makes it easy to parse command line options/arguments in your CUI application."
HOMEPAGE="https://github.com/kohsuke/args4j"
SRC_URI="https://repo1.maven.org/maven2/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
