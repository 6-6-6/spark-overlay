# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /tmp/java-ebuilder/poms/codemodel-2.6.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/sun/codemodel/codemodel/2.6/codemodel-2.6-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/sun/codemodel/codemodel/2.6/codemodel-2.6.jar --slot 2 --keywords "~amd64" --ebuild codemodel-2.6.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.sun.codemodel:codemodel:2.6"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The core functionality of the CodeModel java source code generation library"
HOMEPAGE="https://codemodel.java.net/codemodel/"
SRC_URI="
	https://repo1.maven.org/maven2/com/sun/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/sun/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="CDDL-1.1 GPL-2"
SLOT="2"
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
