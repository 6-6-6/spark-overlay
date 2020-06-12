# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/nimbus-jose-jwt-8.19.pom --download-uri https://repo.maven.apache.org/maven2/com/nimbusds/nimbus-jose-jwt/8.19/nimbus-jose-jwt-8.19-sources.jar --slot 0 --keywords "~amd64" --ebuild nimbus-jose-jwt-8.19.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java library for Javascript Object Signing and Encryption (JOSE) and
        JSON Web Tokens (JWT)"
HOMEPAGE="https://bitbucket.org/connect2id/nimbus-jose-jwt"
SRC_URI="https://repo.maven.apache.org/maven2/com/nimbusds/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.nimbusds:nimbus-jose-jwt:8.19"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.stephenc.jcip:jcip-annotations:1.0-1 -> >=dev-java/jcip-annotations-1.0.1:0
# com.google.crypto.tink:tink:1.2.2 -> >=app-maven/tink-1.4.0_rc2:0
# net.minidev:json-smart:[1.3.1,2.3] -> >=app-maven/json-smart-2.3:1.3
# org.bouncycastle:bcpkix-jdk15on:[1.52,) -> >=dev-java/bcpkix-1.50:1.50
# org.bouncycastle:bcprov-jdk15on:[1.52,) -> >=dev-java/bcprov-1.48:1.48

CDEPEND="
	>=app-maven/json-smart-2.3:1.3
	>=app-maven/tink-1.4.0_rc2:0
	>=dev-java/bcpkix-1.50:1.50
	>=dev-java/bcprov-1.48:1.48
	>=dev-java/jcip-annotations-1.0.1:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jcip-annotations,tink,json-smart-1.3,bcpkix-1.50,bcprov-1.48"
