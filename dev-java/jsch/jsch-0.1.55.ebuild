# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jsch-0.1.55.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/jcraft/jsch/0.1.55/jsch-0.1.55-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/jcraft/jsch/0.1.55/jsch-0.1.55.jar --slot 0 --keywords "~amd64" --ebuild jsch-0.1.55.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.jcraft:jsch:0.1.55"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JSch is a pure Java implementation of SSH2"
HOMEPAGE="http://www.jcraft.com/jsch/"
SRC_URI="https://repo1.maven.org/maven2/com/jcraft/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/jcraft/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.jcraft:jzlib:1.0.7 -> >=dev-java/jzlib-1.1.3:1.1.3

CDEPEND="
	>=dev-java/jzlib-1.1.3:1.1.3
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

JAVA_GENTOO_CLASSPATH="jzlib-1.1.3"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
