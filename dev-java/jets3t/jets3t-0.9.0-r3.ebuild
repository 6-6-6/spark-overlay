# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="net.java.dev.jets3t:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Java toolkit and application suite for Amazon S3, CloudFront and Google Storage"
# The project website does not have HTTPS enabled
HOMEPAGE="http://www.jets3t.org"
SRC_URI="
	https://repo1.maven.org/maven2/net/java/dev/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/net/java/dev/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/java-xmlbuilder-0.4:0
	>=dev-java/commons-codec-1.7:0
	>=dev-java/commons-logging-1.2:0
	>=dev-java/httpcomponents-client-4.5:4
	>=dev-java/httpcore-4.4.1:0
	dev-java/junit:4
	dev-java/jackson-mapper-asl:0
	dev-java/jug:0
	dev-java/barebonesbrowserlaunch:0
	dev-java/jakarta-servlet-api:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
