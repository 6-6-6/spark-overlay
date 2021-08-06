# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /tmp/java-ebuilder/poms/bctls-jdk15on-1.65.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/bouncycastle/bctls-jdk15on/1.65/bctls-jdk15on-1.65-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/bouncycastle/bctls-jdk15on/1.65/bctls-jdk15on-1.65.jar --slot 0 --keywords "~amd64" --ebuild bctls-jdk15on-1.65.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.bouncycastle:bctls-jdk15on:1.65"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The Bouncy Castle Java APIs for TLS and DTLS, including a provider for the JSSE."
HOMEPAGE="http://www.bouncycastle.org/java.html"
SRC_URI="https://repo1.maven.org/maven2/org/bouncycastle/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/bouncycastle/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /tmp/java-ebuilder/poms/${P}.pom
# org.bouncycastle:bcprov-jdk15on:1.65 -> >=dev-java/bcprov-1.68:1.68

CDEPEND="
	>=dev-java/bcprov-1.68:1.68
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

BDEPEND="app-arch/unzip"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="bcprov-1.68"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
