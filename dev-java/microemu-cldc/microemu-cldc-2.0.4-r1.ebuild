# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/microemu-cldc-2.0.4.pom --download-uri https://repo1.maven.org/maven2/org/microemu/microemu-cldc/2.0.4/microemu-cldc-2.0.4-sources.jar --slot 0 --keywords "~amd64" --ebuild microemu-cldc-2.0.4-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.microemu:microemu-cldc:2.0.4"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="cldc interfaces"
HOMEPAGE="http://www.microemu.org/microemu-cldc/"
SRC_URI="https://repo1.maven.org/maven2/org/microemu/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/microemu/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="LGPL-3"
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

JAVA_ENCODING="ISO-8859-1"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
