# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/lz4-1.2.0.pom --download-uri https://repo.maven.apache.org/maven2/net/jpountz/lz4/lz4/1.2.0/lz4-1.2.0-sources.jar --slot 0 --keywords "~amd64" --ebuild lz4-1.2.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java ports and bindings of the LZ4 compression algorithm and the xxHash hashing algorithm"
HOMEPAGE="https://github.com/jpountz/lz4-java"
SRC_URI="https://repo.maven.apache.org/maven2/net/jpountz/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="net.jpountz.lz4:lz4:1.2.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

