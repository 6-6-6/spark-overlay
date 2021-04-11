# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/google-api-services-cloudkms-v1-rev9-1.22.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/google/apis/google-api-services-cloudkms/v1-rev9-1.22.0/google-api-services-cloudkms-v1-rev9-1.22.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/google/apis/google-api-services-cloudkms/v1-rev9-1.22.0/google-api-services-cloudkms-v1-rev9-1.22.0.jar --slot 0 --keywords "~amd64" --ebuild google-api-services-cloudkms-1.9.1.22.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.google.apis:google-api-services-cloudkms:v1-rev9-1.22.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Sonatype helps open source projects to set up Maven repositories on https://oss.sonatype.org/"
HOMEPAGE="http://nexus.sonatype.org/oss-repository-hosting.html/google-api-services-cloudkms"
SRC_URI="https://repo1.maven.org/maven2/com/google/apis/${PN}/v1-rev9-1.22.0/${PN}-v1-rev9-1.22.0-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/google/apis/${PN}/v1-rev9-1.22.0/${PN}-v1-rev9-1.22.0.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-v1-rev9-1.22.0.pom
# com.google.api-client:google-api-client:1.22.0 -> >=dev-java/google-api-client-1.22.0:0

CDEPEND="
	>=dev-java/google-api-client-1.22.0:0
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

JAVA_GENTOO_CLASSPATH="google-api-client"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
