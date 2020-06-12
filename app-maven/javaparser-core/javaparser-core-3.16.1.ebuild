# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/javaparser-core-3.16.1.pom --download-uri https://repo.maven.apache.org/maven2/com/github/javaparser/javaparser-core/3.16.1/javaparser-core-3.16.1-sources.jar --slot 0 --keywords "~amd64" --ebuild javaparser-core-3.16.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The core parser functionality. This may be all you need."
HOMEPAGE="https://github.com/javaparser/javaparser-core"
SRC_URI="https://repo.maven.apache.org/maven2/com/github/javaparser/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.github.javaparser:javaparser-core:3.16.1"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

