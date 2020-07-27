# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/java-xmlbuilder-0.4.pom --download-uri https://repo1.maven.org/maven2/com/jamesmurty/utils/java-xmlbuilder/0.4/java-xmlbuilder-0.4-sources.jar --slot 0 --keywords "~amd64" --ebuild java-xmlbuilder-0.4-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="XML Builder is a utility that creates simple XML documents using relatively sparse Java code"
HOMEPAGE="http://code.google.com/p/java-xmlbuilder/"
SRC_URI="https://repo1.maven.org/maven2/com/jamesmurty/utils/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/jamesmurty/utils/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.jamesmurty.utils:java-xmlbuilder:0.4"



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

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip -q "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
