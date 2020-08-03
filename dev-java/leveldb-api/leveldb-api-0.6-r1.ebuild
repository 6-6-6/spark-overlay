# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/leveldb-api-0.6.pom --download-uri https://repo1.maven.org/maven2/org/iq80/leveldb/leveldb-api/0.6/leveldb-api-0.6-sources.jar --slot 0 --keywords "~amd64" --ebuild leveldb-api-0.6-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.iq80.leveldb:leveldb-api:0.6"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="High level Java API for LevelDB"
HOMEPAGE="http://github.com/dain/leveldb/leveldb-api"
SRC_URI="https://repo1.maven.org/maven2/org/iq80/leveldb/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/iq80/leveldb/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
