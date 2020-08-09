# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/lombok-1.16.16.pom --download-uri https://repo1.maven.org/maven2/org/projectlombok/lombok/1.16.16/lombok-1.16.16-sources.jar --slot 0 --keywords "~amd64" --ebuild lombok-1.16.16-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.projectlombok:lombok:1.16.16"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Spice up your java: Automatic Resource Management, automatic generation of getters, setters, equals, hashCode and toString, and more!"
HOMEPAGE="https://projectlombok.org"
SRC_URI="https://repo1.maven.org/maven2/org/project${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/project${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/junit:4
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_NEEDS_TOOLS=1
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
