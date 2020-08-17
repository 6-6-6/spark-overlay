# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/spotbugs-annotations-3.1.9.pom --download-uri https://repo1.maven.org/maven2/com/github/spotbugs/spotbugs-annotations/3.1.9/spotbugs-annotations-3.1.9-sources.jar --slot 0 --keywords "~amd64" --ebuild spotbugs-annotations-3.1.9-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.github.spotbugs:spotbugs-annotations:3.1.9"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Annotations the SpotBugs tool supports"
HOMEPAGE="https://spotbugs.github.io/"
SRC_URI="https://repo1.maven.org/maven2/com/github/spotbugs/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/github/spotbugs/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.findbugs:jsr305:3.0.2 -> >=dev-java/jsr305-3.0.2:0

CDEPEND="
	>=dev-java/jsr305-3.0.2:0
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

JAVA_GENTOO_CLASSPATH="jsr305"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
