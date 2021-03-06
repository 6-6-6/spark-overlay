# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/lz4-1.3.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/net/jpountz/lz4/lz4/1.3.0/lz4-1.3.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/net/jpountz/lz4/lz4/1.3.0/lz4-1.3.0.jar --slot 0 --keywords "~amd64" --ebuild lz4-1.3.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="net.jpountz.lz4:lz4:1.3.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Java ports and bindings of the LZ4 compression algorithm and the xxHash hashing algorithm"
HOMEPAGE="https://github.com/jpountz/lz4-java"
SRC_URI="https://repo1.maven.org/maven2/net/jpountz/lz4/lz4/${PV}/lz4-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/net/jpountz/lz4/lz4/${PV}/lz4-${PV}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
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
