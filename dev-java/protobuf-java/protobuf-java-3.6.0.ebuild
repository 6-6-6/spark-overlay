# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/protobuf-java-3.6.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/google/protobuf/protobuf-java/3.6.0/protobuf-java-3.6.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/google/protobuf/protobuf-java/3.6.0/protobuf-java-3.6.0.jar --slot 0 --keywords "~amd64" --ebuild protobuf-java-3.6.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.google.protobuf:protobuf-java:3.6.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Core Protocol Buffers library. Protocol Buffers are a way of encoding structured data in an efficient yet extensible format."
HOMEPAGE="https://developers.google.com/protocol-buffers/protobuf-java/"
SRC_URI="https://repo1.maven.org/maven2/com/google/protobuf/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/google/protobuf/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
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
