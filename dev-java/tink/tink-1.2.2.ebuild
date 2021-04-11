# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/tink-1.2.2.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/google/crypto/tink/tink/1.2.2/tink-1.2.2-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/google/crypto/tink/tink/1.2.2/tink-1.2.2.jar --slot 0 --keywords "~amd64" --ebuild tink-1.2.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.google.crypto.tink:tink:1.2.2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Tink is a small cryptographic library that provides a safe, simple, agile and fast way to accomplish some common cryptographic tasks."
HOMEPAGE="http://github.com/google/tink"
SRC_URI="https://repo1.maven.org/maven2/com/google/crypto/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/google/crypto/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.amazonaws:aws-java-sdk-core:1.11.166 -> >=dev-java/aws-java-sdk-core-1.11.166:0
# com.amazonaws:aws-java-sdk-kms:1.11.166 -> >=dev-java/aws-java-sdk-kms-1.11.166:0
# com.google.api-client:google-api-client:1.22.0 -> >=dev-java/google-api-client-1.22.0:0
# com.google.apis:google-api-services-cloudkms:v1-rev9-1.22.0 -> >=dev-java/google-api-services-cloudkms-1.9.1.22.0:0
# com.google.auto.service:auto-service:1.0-rc4 -> >=dev-java/auto-service-1.0_rc4:0
# com.google.guava:guava:25.0-jre -> >=dev-java/guava-29.0:0
# com.google.protobuf:protobuf-java:3.6.0 -> >=dev-java/protobuf-java-3.6.0:0
# org.json:json:20170516 -> >=dev-java/json-20170516:0

CDEPEND="
	>=dev-java/auto-service-1.0_rc4:0
	>=dev-java/aws-java-sdk-core-1.11.166:0
	>=dev-java/aws-java-sdk-kms-1.11.166:0
	>=dev-java/google-api-client-1.22.0:0
	>=dev-java/google-api-services-cloudkms-1.9.1.22.0:0
	>=dev-java/guava-29.0:0
	>=dev-java/json-20170516:0
	>=dev-java/protobuf-java-3.6.0:0
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

JAVA_GENTOO_CLASSPATH="aws-java-sdk-core,aws-java-sdk-kms,google-api-client,google-api-services-cloudkms,auto-service,guava,protobuf-java,json"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
