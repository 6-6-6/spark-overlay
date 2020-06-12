# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-compress-1.20.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/commons/commons-compress/1.20/commons-compress-1.20-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-compress-1.20.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Commons Compress software defines an API for working with
compression and archive formats.  These include: bzip2, gzip, pack200,
lzma, xz, Snappy, traditional Unix Compress, DEFLATE, DEFLATE64, LZ4,
Brotli, Zstandard and ar, cpio, jar, tar, zip, dump, 7z, arj."
HOMEPAGE="https://commons.apache.org/proper/commons-compress/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/commons/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.commons:commons-compress:1.20"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.luben:zstd-jni:1.4.4-7 -> !!!groupId-not-found!!!
# org.brotli:dec:0.1.2 -> !!!groupId-not-found!!!
# org.tukaani:xz:1.8 -> >=dev-java/xz-java-1.8:0

CDEPEND="
	>=app-maven/dec-0.1.2:0
	>=app-maven/zstd-jni-1.4.5.4:0
	>=dev-java/xz-java-1.8:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.osgi:org.osgi.core:6.0.0 -> !!!groupId-not-found!!!

DEPEND="
	>=virtual/jdk-1.7:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/osgi-core-6.0.0:6
"

RDEPEND="
	>=virtual/jre-1.7:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_ENCODING="iso-8859-1"

JAVA_GENTOO_CLASSPATH="zstd-jni,dec,xz-java"
JAVA_GENTOO_CLASSPATH_EXTRA="osgi-core-6"
JAVA_RESOURCE_DIRS=(
	"../../../../../../../../var/lib/java-ebuilder/poms/src/main/resources"
	"../../../../../../../../var/lib/java-ebuilder/poms"
)
