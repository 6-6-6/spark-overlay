# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/HdrHistogram-2.1.9.pom --download-uri https://repo.maven.apache.org/maven2/org/hdrhistogram/HdrHistogram/2.1.9/HdrHistogram-2.1.9-sources.jar --slot 0 --keywords "~amd64" --ebuild HdrHistogram-2.1.9.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="HdrHistogram supports the recording and analyzing sampled data value
        counts across a configurable integer value range with configurable value
        precision within the range. Value precision is expressed as the number of
        significant digits in the value recording, and provides control over value
        quantization behavior across the value range and the subsequent value
        resolution at any given level."
HOMEPAGE="http://hdrhistogram.github.io/HdrHistogram/"
SRC_URI="https://repo.maven.apache.org/maven2/org/hdrhistogram/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.hdrhistogram:HdrHistogram:2.1.9"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
