# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/graal-sdk-20.1.0.pom --download-uri https://repo1.maven.org/maven2/org/graalvm/sdk/graal-sdk/20.1.0/graal-sdk-20.1.0-sources.jar --slot 0 --keywords "~amd64" --ebuild graal-sdk-20.1.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.graalvm.sdk:graal-sdk:20.1.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="GraalVM is an ecosystem for compiling and running applications written in multiple languages. GraalVM removes the isolation between programming languages and enables interoperability in a shared runtime."
HOMEPAGE="https://github.com/oracle/graal"
SRC_URI="https://repo1.maven.org/maven2/org/graalvm/sdk/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/graalvm/sdk/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="UPL-1.0"
SLOT="0"
KEYWORDS="~amd64"

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
