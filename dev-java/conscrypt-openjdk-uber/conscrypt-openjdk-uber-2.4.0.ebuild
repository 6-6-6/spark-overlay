# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /tmp/java-ebuilder/poms/conscrypt-openjdk-uber-2.4.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/conscrypt/conscrypt-openjdk-uber/2.4.0/conscrypt-openjdk-uber-2.4.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/conscrypt/conscrypt-openjdk-uber/2.4.0/conscrypt-openjdk-uber-2.4.0.jar --slot 0 --keywords "~amd64" --ebuild conscrypt-openjdk-uber-2.4.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.conscrypt:conscrypt-openjdk-uber:2.4.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Conscrypt: OpenJdk UberJAR"
HOMEPAGE="https://conscrypt.org/"
SRC_URI="https://repo1.maven.org/maven2/org/conscrypt/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/conscrypt/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="2.4"
KEYWORDS="~amd64"
IUSE="+binary"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

BDEPEND="app-arch/unzip"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
