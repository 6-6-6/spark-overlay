# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/rocksdbjni-6.8.1.pom --download-uri https://repo.maven.apache.org/maven2/org/rocksdb/rocksdbjni/6.8.1/rocksdbjni-6.8.1-sources.jar --slot 0 --keywords "~amd64" --ebuild rocksdbjni-6.8.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="RocksDB fat jar that contains .so files for linux32 and linux64 (glibc and musl-libc), jnilib files
        for Mac OSX, and a .dll for Windows x64."
HOMEPAGE="http://rocksdb.org/"
SRC_URI="https://repo.maven.apache.org/maven2/org/rocksdb/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.rocksdb:rocksdbjni:6.8.1"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

