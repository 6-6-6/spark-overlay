# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jets3t-0.9.0.pom --download-uri https://repo1.maven.org/maven2/net/java/dev/jets3t/jets3t/0.9.0/jets3t-0.9.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jets3t-0.9.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="net.java.dev.jets3t:jets3t:0.9.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Java toolkit and application suite for Amazon S3, CloudFront and Google Storage"
HOMEPAGE="http://www.jets3t.org"
SRC_URI="
	https://repo1.maven.org/maven2/net/java/dev/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/net/java/dev/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.jamesmurty.utils:java-xmlbuilder:0.4 -> >=dev-java/java-xmlbuilder-0.4:0
# commons-codec:commons-codec:1.4 -> >=dev-java/commons-codec-1.7:0
# commons-logging:commons-logging:1.1.1 -> >=dev-java/commons-logging-1.2:0
# org.apache.httpcomponents:httpclient:4.1.2 -> >=dev-java/commons-httpclient-4.5:4
# org.apache.httpcomponents:httpcore:4.1.2 -> >=dev-java/httpcore-4.4.1:0

CDEPEND="
	>=dev-java/java-xmlbuilder-0.4:0
	>=dev-java/commons-codec-1.7:0
	>=dev-java/commons-logging-1.2:0
	>=dev-java/commons-httpclient-4.5:4
	>=dev-java/httpcore-4.4.1:0
	dev-java/junit:4
	dev-java/jackson-mapper-asl:0
	dev-java/jug:0
	dev-java/barebonesbrowserlaunch:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="java-xmlbuilder,commons-codec,commons-logging,commons-httpclient-4,httpcore,junit-4,jackson-mapper-asl,jug,barebonesbrowserlaunch"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
