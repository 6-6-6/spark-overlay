# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/RoaringBitmap-0.8.20.pom --download-uri https://repo.maven.apache.org/maven2/org/roaringbitmap/RoaringBitmap/0.8.20/RoaringBitmap-0.8.20-sources.jar --slot 0 --keywords "~amd64" --ebuild RoaringBitmap-0.8.20.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Roaring bitmaps are compressed bitmaps (also called bitsets) which tend to outperform conventional compressed bitmaps such as WAH or Concise."
HOMEPAGE="https://github.com/RoaringBitmap/RoaringBitmap"
SRC_URI="https://repo.maven.apache.org/maven2/org/roaringbitmap/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="${PV}"
KEYWORDS="~amd64"
MAVEN_ID="org.roaringbitmap:RoaringBitmap:0.8.18"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.roaringbitmap:shims:0.8.18 -> dev-java/roaringbitmap-shims:${SLOT}
RDEPEND="
	>=virtual/jre-1.8:*

	dev-java/roaringbitmap-shims:${SLOT}
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="roaringbitmap-shims-${SLOT}"
