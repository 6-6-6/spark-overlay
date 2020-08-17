# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/objectfile-19.2.1.pom --download-uri https://repo1.maven.org/maven2/com/oracle/substratevm/objectfile/19.2.1/objectfile-19.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild objectfile-19.2.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.oracle.substratevm:objectfile:19.2.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="SubstrateVM object file writing library"
HOMEPAGE="https://github.com/oracle/graal/tree/master/substratevm"
SRC_URI="https://repo1.maven.org/maven2/com/oracle/substratevm/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/oracle/substratevm/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="GPL-2-with-classpath-exception"
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
