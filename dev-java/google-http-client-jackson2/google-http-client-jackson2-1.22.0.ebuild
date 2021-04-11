# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/google-http-client-jackson2-1.22.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/google/http-client/google-http-client-jackson2/1.22.0/google-http-client-jackson2-1.22.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/google/http-client/google-http-client-jackson2/1.22.0/google-http-client-jackson2-1.22.0.jar --slot 0 --keywords "~amd64" --ebuild google-http-client-jackson2-1.22.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.google.http-client:google-http-client-jackson2:1.22.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Sonatype helps open source projects to set up Maven repositories on https://oss.sonatype.org/"
HOMEPAGE="https://github.com/google/google-http-java-client/google-http-client-jackson2"
SRC_URI="https://repo1.maven.org/maven2/com/google/http-client/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/google/http-client/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-core:2.1.3 -> >=dev-java/jackson-2.9.10:2
# com.google.http-client:google-http-client:1.22.0 -> >=dev-java/google-http-client-1.22.0:0

CDEPEND="
	>=dev-java/google-http-client-1.22.0:0
	>=dev-java/jackson-2.9.10:2
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

JAVA_GENTOO_CLASSPATH="jackson-2,google-http-client"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
