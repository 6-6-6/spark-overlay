# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-collections-3.2.2.pom --download-uri https://repo1.maven.org/maven2/commons-collections/commons-collections/3.2.2/commons-collections-3.2.2-sources.jar --slot 3 --keywords "~amd64" --ebuild commons-collections-3.2.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Types that extend and augment the Java Collections Framework."
HOMEPAGE="http://commons.apache.org/collections/"
SRC_URI="mirror://apache/${PN/-//}/source/${P}-src.tar.gz"
LICENSE=""
SLOT="3"
KEYWORDS="amd64 ppc64 x86"
MAVEN_ID="commons-collections:commons-collections:3.2.2"

PATCHES=( "${FILESDIR}/${P}-Java-8.patch" )

DEPEND="
	>=virtual/jdk-1.3:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.3:*
"

S="${WORKDIR}/${P}-src"

JAVA_ENCODING="iso-8859-1"

JAVA_SRC_DIR="src/java"

src_prepare() {
	default
}
