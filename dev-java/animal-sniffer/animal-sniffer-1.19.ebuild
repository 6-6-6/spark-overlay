# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /tmp/srcs/ans/animal-sniffer-animal-sniffer-parent-1.19/animal-sniffer/pom.xml --download-uri https://github.com/mojohaus/animal-sniffer/archive/animal-sniffer-parent-1.19.tar.gz --slot 0 --keywords "~amd64" --ebuild animal-sniffer-1.19.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.codehaus.mojo:animal-sniffer:1.19"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Animal Sniffer."
HOMEPAGE="http://www.mojohaus.org/animal-sniffer/animal-sniffer"
SRC_URI="https://github.com/mojohaus/${PN}/archive/${PN}-parent-${PV}.tar.gz -> ${P}-sources.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /tmp/srcs/ans/${PN}-${PN}-parent-${PV}/${PN}/pom.xml
# org.ow2.asm:asm:7.3.1 -> >=dev-java/asm-8.0.1:7

CDEPEND="
	>=dev-java/asm-8.0.1:7
"

# Compile dependencies
# POM: /tmp/srcs/ans/${PN}-${PN}-parent-${PV}/${PN}/pom.xml
# test? junit:junit:4.12 -> >=dev-java/junit-4.12:4

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="asm-7"
JAVA_SRC_DIR="${PN}-${PN}-parent-${PV}/${PN}/src/main/java"
JAVA_MAIN_CLASS="org.codehaus.mojo.animal_sniffer.Main"

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="${PN}-${PN}-parent-${PV}/${PN}/src/test/java"
JAVA_TEST_RESOURCE_DIRS=(
	"${PN}-${PN}-parent-${PV}/${PN}/src/test/resources"
)
