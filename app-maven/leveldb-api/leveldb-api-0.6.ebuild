# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/leveldb-api-0.6.pom --download-uri https://repo.maven.apache.org/maven2/org/iq80/leveldb/leveldb-api/0.6/leveldb-api-0.6-sources.jar --slot 0 --keywords "~amd64" --ebuild leveldb-api-0.6.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="High level Java API for LevelDB"
HOMEPAGE="http://github.com/dain/leveldb/leveldb-api"
SRC_URI="https://repo.maven.apache.org/maven2/org/iq80/leveldb/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.iq80.leveldb:leveldb-api:0.6"



DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
