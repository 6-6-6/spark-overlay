# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/chill-java-0.9.3.pom --download-uri https://repo1.maven.org/maven2/com/twitter/chill-java/0.9.3/chill-java-0.9.3-sources.jar --slot 0 --keywords "~amd64" --ebuild chill-java-0.9.3-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.twitter:chill-java:0.9.3"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="chill-java"
HOMEPAGE="https://github.com/twitter/chill"
SRC_URI="https://repo1.maven.org/maven2/com/twitter/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/twitter/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.esotericsoftware:kryo-shaded:4.0.2 -> >=dev-java/kryo-shaded-4.0.2:0

CDEPEND="
	>=dev-java/kryo-shaded-4.0.2:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="kryo-shaded"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
