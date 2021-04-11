# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/oauth2-oidc-sdk-4.5.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/nimbusds/oauth2-oidc-sdk/4.5/oauth2-oidc-sdk-4.5-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/nimbusds/oauth2-oidc-sdk/4.5/oauth2-oidc-sdk-4.5.jar --slot 0 --keywords "~amd64" --ebuild oauth2-oidc-sdk-4.5.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.nimbusds:oauth2-oidc-sdk:4.5"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="OAuth 2.0 SDK with OpenID Connection extensions for developing 		client and server applications."
HOMEPAGE="https://bitbucket.org/connect2id/oauth-2.0-sdk-with-openid-connect-extensions"
SRC_URI="https://repo1.maven.org/maven2/com/nimbusds/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/nimbusds/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.nimbusds:lang-tag:1.4 -> >=dev-java/lang-tag-1.4:0
# com.nimbusds:nimbus-jose-jwt:3.1.2 -> >=dev-java/nimbus-jose-jwt-7.9:0
# commons-codec:commons-codec:1.9 -> >=dev-java/commons-codec-1.11:0
# javax.mail:mail:1.4.7 -> >=dev-java/mail-1.4.7:0
# net.jcip:jcip-annotations:1.0 -> >=dev-java/jcip-annotations-1.0.1:0
# net.minidev:json-smart:1.1.1 -> >=dev-java/json-smart-1.3.1:0
# org.apache.commons:commons-lang3:3.3.1 -> >=dev-java/commons-lang-3.3.2:3.3

CDEPEND="
	>=dev-java/commons-codec-1.11:0
	>=dev-java/commons-lang-3.3.2:3.3
	>=dev-java/jcip-annotations-1.0.1:0
	>=dev-java/json-smart-1.3.1:0
	>=dev-java/lang-tag-1.4:0
	>=dev-java/mail-1.4.7:0
	>=dev-java/nimbus-jose-jwt-7.9:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.servlet:javax.servlet-api:3.0.1 -> java-virtuals/servlet-api:4.0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		java-virtuals/servlet-api:4.0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="lang-tag,nimbus-jose-jwt,commons-codec,mail,jcip-annotations,json-smart,commons-lang-3.3"
JAVA_CLASSPATH_EXTRA="servlet-api-4.0"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
