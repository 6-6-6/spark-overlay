# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-codec-1.14.pom --download-uri https://repo.maven.apache.org/maven2/commons-codec/commons-codec/1.14/commons-codec-1.14-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-codec-1.14.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Apache Commons Codec package contains simple encoder and decoders for
     various formats such as Base64 and Hexadecimal.  In addition to these
     widely used encoders and decoders, the codec package also maintains a
     collection of phonetic encoding utilities."
HOMEPAGE="https://commons.apache.org/proper/commons-codec/"
SRC_URI="https://repo.maven.apache.org/maven2/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="commons-codec:commons-codec:1.14"



DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.7:*
"

S="${WORKDIR}"

JAVA_RESOURCE_DIRS=(
	"../../../../../../../../var/lib/java-ebuilder/poms/src/main/resources"
	"../../../../../../../../var/lib/java-ebuilder/poms"
)
