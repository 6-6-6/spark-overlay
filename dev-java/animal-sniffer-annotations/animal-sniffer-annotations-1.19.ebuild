# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /tmp/srcs/ans/animal-sniffer-animal-sniffer-parent-1.19/animal-sniffer-annotations/pom.xml --download-uri https://github.com/mojohaus/animal-sniffer/archive/animal-sniffer-parent-1.19.tar.gz --slot 0 --keywords "~amd64" --ebuild animal-sniffer-annotations-1.19.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.codehaus.mojo:animal-sniffer-annotations:1.19"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Animal Sniffer Parent POM."
HOMEPAGE="http://www.mojohaus.org/animal-sniffer/animal-sniffer-annotations"
SRC_URI="https://github.com/mojohaus/animal-sniffer/archive/animal-sniffer-parent-${PV}.tar.gz -> ${P}-sources.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="animal-sniffer-animal-sniffer-parent-${PV}/${PN}/src/main/java"
