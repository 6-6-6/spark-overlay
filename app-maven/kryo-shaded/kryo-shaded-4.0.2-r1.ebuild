# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/kryo-shaded-4.0.2.pom --download-uri https://repo1.maven.org/maven2/com/esotericsoftware/kryo-shaded/4.0.2/kryo-shaded-4.0.2-sources.jar --slot 0 --keywords "~amd64" --ebuild kryo-shaded-4.0.2-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Fast, efficient Java serialization. This contains the shaded reflectasm jar to prevent conflicts with other versions of asm."
HOMEPAGE="https://github.com/EsotericSoftware/kryo/kryo-shaded"
SRC_URI="https://repo1.maven.org/maven2/com/esotericsoftware/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/esotericsoftware/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.esotericsoftware:kryo-shaded:4.0.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.esotericsoftware:minlog:1.3.0 -> >=dev-java/minlog-1.3.1:0
# org.objenesis:objenesis:2.5.1 -> >=dev-java/objenesis-2.5.1:0

CDEPEND="
	>=dev-java/minlog-1.3.1:0
	>=dev-java/objenesis-2.5.1:0
	dev-java/reflectasm:0
"


DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.7:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="minlog,objenesis,reflectasm"
JAVA_SRC_DIR="src"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

