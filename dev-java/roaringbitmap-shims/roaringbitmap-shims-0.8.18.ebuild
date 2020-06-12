# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/shims-0.8.18.pom --download-uri https://repo.maven.apache.org/maven2/org/roaringbitmap/shims/0.8.18/shims-0.8.18-sources.jar --slot 0 --keywords "~amd64" --ebuild shims-0.8.18.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="shims"

DESCRIPTION="Roaring bitmaps are compressed bitmaps (also called bitsets) which tend to outperform conventional compressed bitmaps such as WAH or Concise."
HOMEPAGE="https://github.com/RoaringBitmap/RoaringBitmap"
SRC_URI="https://repo.maven.apache.org/maven2/org/roaringbitmap/${MY_PN}/${PV}/${MY_PN}-${PV}-sources.jar"
LICENSE=""
SLOT="${PV}"
KEYWORDS="~amd64"
MAVEN_ID="org.roaringbitmap:shims:0.8.18"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

