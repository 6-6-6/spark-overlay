# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/azure-keyvault-0.9.7.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/microsoft/azure/azure-keyvault/0.9.7/azure-keyvault-0.9.7-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/microsoft/azure/azure-keyvault/0.9.7/azure-keyvault-0.9.7.jar --slot 0 --keywords "~amd64" --ebuild azure-keyvault-0.9.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.microsoft.azure:azure-keyvault:0.9.7"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="This package contains Microsoft Azure SDK for Key Vault."
HOMEPAGE="https://github.com/Azure/azure-sdk-for-java"
SRC_URI="https://repo1.maven.org/maven2/com/microsoft/azure/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/microsoft/azure/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.microsoft.azure:adal4j:1.0.0 -> >=dev-java/adal4j-1.1.3:0
# com.microsoft.azure:azure-core:0.9.7 -> >=dev-java/azure-core-0.9.7:0
# javax.inject:javax.inject:1 -> >=dev-java/javax-inject-1:0
# org.apache.httpcomponents:httpclient:4.3.6 -> >=dev-java/httpcomponents-client-4.5:4.5

CDEPEND="
	>=dev-java/adal4j-1.1.3:0
	>=dev-java/azure-core-0.9.7:0
	>=dev-java/httpcomponents-client-4.5:4.5
	>=dev-java/javax-inject-1:0
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

JAVA_GENTOO_CLASSPATH="adal4j,azure-core,javax-inject,httpcomponents-client-4.5"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
