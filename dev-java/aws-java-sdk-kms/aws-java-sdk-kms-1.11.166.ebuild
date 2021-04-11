# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/aws-java-sdk-kms-1.11.166.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-kms/1.11.166/aws-java-sdk-kms-1.11.166-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-kms/1.11.166/aws-java-sdk-kms-1.11.166.jar --slot 0 --keywords "~amd64" --ebuild aws-java-sdk-kms-1.11.166.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.amazonaws:aws-java-sdk-kms:1.11.166"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The AWS Java SDK for AWS KMS module holds the client classes that are used for communicating with AWS Key Management Service"
HOMEPAGE="https://aws.amazon.com/sdkforjava"
SRC_URI="https://repo1.maven.org/maven2/com/amazonaws/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/amazonaws/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.amazonaws:aws-java-sdk-core:1.11.166 -> >=dev-java/aws-java-sdk-core-1.11.166:0
# com.amazonaws:jmespath-java:1.11.166 -> >=dev-java/jmespath-java-1.11.166:0

CDEPEND="
	>=dev-java/aws-java-sdk-core-1.11.166:0
	>=dev-java/jmespath-java-1.11.166:0
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

JAVA_GENTOO_CLASSPATH="aws-java-sdk-core,jmespath-java"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
