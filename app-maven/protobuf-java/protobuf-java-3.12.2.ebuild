# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/protobuf-java-3.12.2.pom --download-uri https://repo.maven.apache.org/maven2/com/google/protobuf/protobuf-java/3.12.2/protobuf-java-3.12.2-sources.jar --slot 0 --keywords "~amd64" --ebuild protobuf-java-3.12.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Core Protocol Buffers library. Protocol Buffers are a way of encoding structured data in an
    efficient yet extensible format."
HOMEPAGE="https://developers.google.com/protocol-buffers/protobuf-java/"
SRC_URI="https://repo.maven.apache.org/maven2/com/google/protobuf/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.google.protobuf:protobuf-java:3.12.2"



DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.7:*
"

S="${WORKDIR}"

