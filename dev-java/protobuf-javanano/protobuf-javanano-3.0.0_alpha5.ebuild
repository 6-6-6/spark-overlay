# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/protobuf-javanano-3.0.0-alpha-5.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/google/protobuf/nano/protobuf-javanano/3.0.0-alpha-5/protobuf-javanano-3.0.0-alpha-5-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/google/protobuf/nano/protobuf-javanano/3.0.0-alpha-5/protobuf-javanano-3.0.0-alpha-5.jar --slot 0 --keywords "~amd64" --ebuild protobuf-javanano-3.0.0_alpha5.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.google.protobuf.nano:protobuf-javanano:3.0.0-alpha-5"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Protocol Buffers are a way of encoding structured data in an efficient yet extensible format."
HOMEPAGE="https://developers.google.com/protocol-buffers/"
SRC_URI="https://repo1.maven.org/maven2/com/google/protobuf/nano/${PN}/3.0.0-alpha-5/${PN}-3.0.0-alpha-5-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/google/protobuf/nano/${PN}/3.0.0-alpha-5/${PN}-3.0.0-alpha-5.jar -> ${P}-bin.jar"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
