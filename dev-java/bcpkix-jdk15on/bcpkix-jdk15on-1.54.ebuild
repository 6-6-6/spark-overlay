# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/bcpkix-jdk15on-1.54.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/bouncycastle/bcpkix-jdk15on/1.54/bcpkix-jdk15on-1.54-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/bouncycastle/bcpkix-jdk15on/1.54/bcpkix-jdk15on-1.54.jar --slot 0 --keywords "~amd64" --ebuild bcpkix-jdk15on-1.54.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.bouncycastle:bcpkix-jdk15on:1.54"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The Bouncy Castle Java APIs for CMS, PKCS, EAC, TSP, CMP, CRMF, OCSP, and certificate generation. This jar contains APIs for JDK 1.5 to JDK 1.8. The APIs can be used in conjunction with a JCE/JCA provider such as the one provided with the Bouncy Castle Cryptography APIs."
HOMEPAGE="http://www.bouncycastle.org/java.html"
SRC_URI="https://repo1.maven.org/maven2/org/bouncycastle/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/bouncycastle/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.bouncycastle:bcprov-jdk15on:1.54 -> >=dev-java/bcprov-1.54:1.54

CDEPEND="
	>=dev-java/bcprov-1.54:1.54
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

JAVA_GENTOO_CLASSPATH="bcprov-1.54"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
