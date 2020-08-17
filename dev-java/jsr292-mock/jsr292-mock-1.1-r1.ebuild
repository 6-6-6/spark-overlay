# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jsr292-mock-1.1.pom --download-uri https://repo1.maven.org/maven2/com/headius/jsr292-mock/1.1/jsr292-mock-1.1-sources.jar --slot 0 --keywords "~amd64" --ebuild jsr292-mock-1.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.headius:jsr292-mock:1.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Sonatype helps open source projects to set up Maven repositories on https://oss.sonatype.org/"
HOMEPAGE="https://github.com/headius/jsr292-mock"
SRC_URI="https://repo1.maven.org/maven2/com/headius/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/headius/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.ow2.asm:asm-debug-all:5.0_BETA -> >=dev-java/asm-debug-all-5.0:0

CDEPEND="
	>=dev-java/asm-debug-all-5.0:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="asm-debug-all"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
