# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/google-oauth-client-1.22.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/google/oauth-client/google-oauth-client/1.22.0/google-oauth-client-1.22.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/google/oauth-client/google-oauth-client/1.22.0/google-oauth-client-1.22.0.jar --slot 0 --keywords "~amd64" --ebuild google-oauth-client-1.22.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.google.oauth-client:google-oauth-client:1.22.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Google OAuth Client Library for Java. Functionality that works on all supported Java platforms, including Java 5 (or higher) desktop (SE) and web (EE), Android, and Google App Engine."
HOMEPAGE="https://github.com/google/google-oauth-java-client/google-oauth-client"
SRC_URI="https://repo1.maven.org/maven2/com/google/oauth-client/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/google/oauth-client/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.findbugs:jsr305:1.3.9 -> >=dev-java/jsr305-3.0.1:0
# com.google.http-client:google-http-client:1.22.0 -> >=dev-java/google-http-client-1.22.0:0

CDEPEND="
	>=dev-java/google-http-client-1.22.0:0
	>=dev-java/jsr305-3.0.1:0
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

JAVA_GENTOO_CLASSPATH="jsr305,google-http-client"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
