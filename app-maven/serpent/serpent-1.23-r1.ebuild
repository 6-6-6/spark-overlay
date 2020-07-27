# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/serpent-1.23.pom --download-uri https://repo1.maven.org/maven2/net/razorvine/serpent/1.23/serpent-1.23-sources.jar --slot 0 --keywords "~amd64" --ebuild serpent-1.23-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Serpent serializes an object tree into a Python ast.literal_eval() compatible literal expression. It is safe to send serpent data to other machines over the network for instance
(because only 'safe' literals are encoded).
There is also a deserializer or parse provided that turns such a literal expression back into the appropriate Java object tree.

It is an alternative to JSON to provide easy data integration between Java and Python.  Serpent is more expressive as JSON (it supports more data types)."
HOMEPAGE="https://github.com/irmen/Serpent"
SRC_URI="https://repo1.maven.org/maven2/net/razorvine/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/net/razorvine/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="net.razorvine:serpent:1.23"



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
