# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/compress-lzf-1.0.4.pom --download-uri https://repo.maven.apache.org/maven2/com/ning/compress-lzf/1.0.4/compress-lzf-1.0.4-sources.jar --slot 0 --keywords "~amd64" --ebuild compress-lzf-1.0.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Compression codec for LZF encoding for particularly encoding/decoding, with reasonable compression.
Compressor is basic Lempel-Ziv codec, without Huffman (deflate/gzip) or statistical post-encoding.
See \"http://oldhome.schmorp.de/marc/liblzf.html\" for more on original LZF package."
HOMEPAGE="http://github.com/ning/compress"
SRC_URI="https://repo.maven.apache.org/maven2/com/ning/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.ning:compress-lzf:1.0.4"



DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

