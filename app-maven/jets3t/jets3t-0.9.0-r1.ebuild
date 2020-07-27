# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jets3t-0.9.0.pom --download-uri https://repo1.maven.org/maven2/net/java/dev/jets3t/jets3t/0.9.0/jets3t-0.9.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jets3t-0.9.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JetS3t is a free, open-source Java toolkit and application suite for Amazon Simple Storage Service (Amazon S3), Amazon CloudFront content delivery network, and Google Storage for Developers."
HOMEPAGE="http://www.jets3t.org"
SRC_URI="https://repo1.maven.org/maven2/net/java/dev/${PN}/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/net/java/dev/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="net.java.dev.jets3t:jets3t:0.9.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.jamesmurty.utils:java-xmlbuilder:0.4 -> >=app-maven/java-xmlbuilder-0.4:0
# commons-codec:commons-codec:1.4 -> >=dev-java/commons-codec-1.7:0
# commons-logging:commons-logging:1.1.1 -> >=dev-java/commons-logging-1.2:0
# org.apache.httpcomponents:httpclient:4.1.2 -> >=dev-java/httpcomponents-client-4.5:4.5
# org.apache.httpcomponents:httpcore:4.1.2 -> >=dev-java/httpcomponents-core-4.4.1:4.4

CDEPEND="
	>=app-maven/java-xmlbuilder-0.4:0
	>=dev-java/commons-codec-1.7:0
	>=dev-java/commons-logging-1.2:0
	>=dev-java/httpcomponents-client-4.5:4.5
	>=dev-java/httpcomponents-core-4.4.1:4.4
	dev-java/junit:4
	app-maven/jackson-mapper-asl:0
	app-maven/jug:0
	dev-java/barebonesbrowserlaunch:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="java-xmlbuilder,commons-codec,commons-logging,httpcomponents-client-4.5,httpcomponents-core-4.4,junit-4,jackson-mapper-asl,jug,barebonesbrowserlaunch"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
