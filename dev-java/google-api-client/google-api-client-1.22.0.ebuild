# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/google-api-client-1.22.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/google/api-client/google-api-client/1.22.0/google-api-client-1.22.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/google/api-client/google-api-client/1.22.0/google-api-client-1.22.0.jar --slot 0 --keywords "~amd64" --ebuild google-api-client-1.22.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.google.api-client:google-api-client:1.22.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Sonatype helps open source projects to set up Maven repositories on https://oss.sonatype.org/"
HOMEPAGE="https://github.com/google/google-api-java-client/google-api-client"
SRC_URI="https://repo1.maven.org/maven2/com/google/api-client/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/google/api-client/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava-jdk5:17.0 -> >=dev-java/guava-jdk5-17.0:0
# com.google.http-client:google-http-client-jackson2:1.22.0 -> >=dev-java/google-http-client-jackson2-1.22.0:0
# com.google.oauth-client:google-oauth-client:1.22.0 -> >=dev-java/google-oauth-client-1.22.0:0

CDEPEND="
	>=dev-java/google-http-client-jackson2-1.22.0:0
	>=dev-java/google-oauth-client-1.22.0:0
	>=dev-java/guava-jdk5-17.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# commons-codec:commons-codec:1.6 -> >=dev-java/commons-codec-1.7:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/commons-codec-1.7:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guava-jdk5,google-http-client-jackson2,google-oauth-client"
JAVA_CLASSPATH_EXTRA="commons-codec"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
