# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/aws-java-sdk-core-1.11.166.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-core/1.11.166/aws-java-sdk-core-1.11.166-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-core/1.11.166/aws-java-sdk-core-1.11.166.jar --slot 0 --keywords "~amd64" --ebuild aws-java-sdk-core-1.11.166.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.amazonaws:aws-java-sdk-core:1.11.166"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The AWS SDK for Java - Core module holds the classes that are used by the individual service clients to interact with Amazon Web Services. Users need to depend on aws-java-sdk artifact for accessing individual client classes."
HOMEPAGE="https://aws.amazon.com/sdkforjava"
SRC_URI="https://repo1.maven.org/maven2/com/amazonaws/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/amazonaws/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-databind:2.6.7.1 -> >=dev-java/jackson-databind-2.10.0:0
# com.fasterxml.jackson.dataformat:jackson-dataformat-cbor:2.6.7 -> >=dev-java/jackson-dataformat-cbor-2.6.7:0
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# joda-time:joda-time:2.8.1 -> >=dev-java/joda-time-2.9.7:0
# org.apache.httpcomponents:httpclient:4.5.2 -> >=dev-java/httpclient-4.5.6:0
# software.amazon.ion:ion-java:1.0.2 -> >=dev-java/ion-java-1.0.2:0

CDEPEND="
	>=dev-java/commons-logging-1.2:0
	>=dev-java/httpclient-4.5.6:0
	>=dev-java/ion-java-1.0.2:0
	>=dev-java/jackson-databind-2.10.0:0
	>=dev-java/jackson-dataformat-cbor-2.6.7:0
	>=dev-java/joda-time-2.9.7:0
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

JAVA_GENTOO_CLASSPATH="jackson-databind,jackson-dataformat-cbor,commons-logging,joda-time,httpclient,ion-java"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
