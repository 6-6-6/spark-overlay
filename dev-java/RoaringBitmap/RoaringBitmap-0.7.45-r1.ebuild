# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/RoaringBitmap-0.7.45.pom --download-uri https://repo1.maven.org/maven2/org/roaringbitmap/RoaringBitmap/0.7.45/RoaringBitmap-0.7.45-sources.jar --slot 0 --keywords "~amd64" --ebuild RoaringBitmap-0.7.45-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.roaringbitmap:RoaringBitmap:0.7.45"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Roaring bitmaps are compressed bitmaps (also called bitsets) which tend to outperform conventional compressed bitmaps such as WAH or Concise."
HOMEPAGE="https://github.com/RoaringBitmap/RoaringBitmap"
SRC_URI="https://repo1.maven.org/maven2/org/roaringbitmap/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/roaringbitmap/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.roaringbitmap:shims:0.7.45 -> >=dev-java/shims-0.7.45:0

CDEPEND="
	>=dev-java/shims-0.7.45:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="shims"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
