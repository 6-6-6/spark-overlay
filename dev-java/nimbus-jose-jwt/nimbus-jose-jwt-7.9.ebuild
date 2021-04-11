# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/nimbus-jose-jwt-7.9.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/nimbusds/nimbus-jose-jwt/7.9/nimbus-jose-jwt-7.9-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/nimbusds/nimbus-jose-jwt/7.9/nimbus-jose-jwt-7.9.jar --slot 0 --keywords "~amd64" --ebuild nimbus-jose-jwt-7.9.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.nimbusds:nimbus-jose-jwt:7.9"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Java library for Javascript Object Signing and Encryption (JOSE) and JSON Web Tokens (JWT)"
HOMEPAGE="https://bitbucket.org/connect2id/nimbus-jose-jwt"
SRC_URI="https://repo1.maven.org/maven2/com/nimbusds/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/nimbusds/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.stephenc.jcip:jcip-annotations:1.0-1 -> >=dev-java/jcip-annotations-1.0.1:0
# com.google.crypto.tink:tink:1.2.2 -> >=dev-java/tink-1.2.2:0
# net.minidev:json-smart:[1.3.1,2.3] -> >=dev-java/json-smart-1.3.1:0
# org.bouncycastle:bcpkix-jdk15on:[1.52,) -> >=dev-java/bcpkix-1.52:1.52
# org.bouncycastle:bcprov-jdk15on:[1.52,) -> >=dev-java/bcprov-1.52:1.52

CDEPEND="
	>=dev-java/bcpkix-1.52:1.52
	>=dev-java/bcprov-1.52:1.52
	>=dev-java/jcip-annotations-1.0.1:0
	>=dev-java/json-smart-1.3.1:0
	>=dev-java/tink-1.2.2:0
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

JAVA_GENTOO_CLASSPATH="jcip-annotations,tink,json-smart,bcpkix-1.52,bcprov-1.52"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
