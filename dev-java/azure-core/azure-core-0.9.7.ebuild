# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/azure-core-0.9.7.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/microsoft/azure/azure-core/0.9.7/azure-core-0.9.7-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/microsoft/azure/azure-core/0.9.7/azure-core-0.9.7.jar --slot 0 --keywords "~amd64" --ebuild azure-core-0.9.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.microsoft.azure:azure-core:0.9.7"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="This is the core module of Microsoft Azure SDK."
HOMEPAGE="https://github.com/Azure/azure-sdk-for-java"
SRC_URI="https://repo1.maven.org/maven2/com/microsoft/azure/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/microsoft/azure/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.sun.jersey:jersey-client:1.19 -> >=dev-java/jersey-client-1.19:0
# com.sun.jersey:jersey-json:1.19 -> >=dev-java/jersey-json-1.19:0
# commons-codec:commons-codec:1.10 -> >=dev-java/commons-codec-1.11:0
# commons-lang:commons-lang:2.6 -> >=dev-java/commons-lang-2.6:2.1
# javax.inject:javax.inject:1 -> >=dev-java/javax-inject-1:0
# javax.mail:mail:1.4.5 -> >=dev-java/mail-1.4.7:0
# org.apache.httpcomponents:httpclient:4.3.6 -> >=dev-java/httpcomponents-client-4.5:4.5

CDEPEND="
	>=dev-java/commons-codec-1.11:0
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/httpcomponents-client-4.5:4.5
	>=dev-java/javax-inject-1:0
	>=dev-java/jersey-client-1.19:0
	>=dev-java/jersey-json-1.19:0
	>=dev-java/mail-1.4.7:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.xml.bind:jaxb-api:2.2.7 -> >=dev-java/jaxb-api-2.2.7:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/jaxb-api-2.2.7:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jersey-client,jersey-json,commons-codec,commons-lang-2.1,javax-inject,mail,httpcomponents-client-4.5"
JAVA_CLASSPATH_EXTRA="jaxb-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
