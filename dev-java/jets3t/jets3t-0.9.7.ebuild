# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.jets3t:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java toolkit and application suite for Amazon S3, CloudFront and Google Storage"
HOMEPAGE="https://github.com/mondain/jets3t"

SRC_URI="https://github.com/mondain/jets3t/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${P}/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/commons-codec:0
	dev-java/httpcomponents-client:4
	dev-java/jackson-core:0
	dev-java/jackson-databind:0
	dev-java/java-xmlbuilder:0
	dev-java/slf4j-api:1
	java-virtuals/servlet-api:3.1
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	${CP_DEPEND}
"

JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=( "src/main/resources" )

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS=( "src/test/resources" )
JAVA_TEST_EXCLUDES=(
	# No runnable test methods
	org.jets3t.service.TestFileUtils
	# Abstract class
	org.jets3t.service.BaseStorageServiceTests
	# Accesses accounts.google.com
	# Requires API key
	org.jets3t.service.TestGoogleStorageServiceOAuth
	org.jets3t.service.TestGoogleStorageService
	# Accesses storage.googleapis.com
	org.jets3t.service.TestRestS3ServiceToGoogleStorage
	# Accesses cloudfront.amazonaws.com
	org.jets3t.service.TestAmazonCloudFront
	# Accesses s3.amazonaws.com
	org.jets3t.service.TestAWSRequestSignatureVersion4
	org.jets3t.service.TestRestS3Service
	org.jets3t.service.TestRestS3V4SignatureUploads
)
