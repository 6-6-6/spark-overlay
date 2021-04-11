# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/adal4j-1.1.3.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/microsoft/azure/adal4j/1.1.3/adal4j-1.1.3-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/microsoft/azure/adal4j/1.1.3/adal4j-1.1.3.jar --slot 0 --keywords "~amd64" --ebuild adal4j-1.1.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.microsoft.azure:adal4j:1.1.3"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Azure active directory library for Java gives you the ability to add Windows Azure Active Directory authentication to your web application with just a few lines of additional code. Using our ADAL SDKs you can quickly and easily extend your existing application to all the employees that use Windows Azure AD and Active Directory on-premises using Active Directory Federation Services, including Office365 customers."
HOMEPAGE="https://github.com/AzureAD/azure-activedirectory-library-for-java"
SRC_URI="https://repo1.maven.org/maven2/com/microsoft/azure/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/microsoft/azure/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.gson:gson:2.2.4 -> >=dev-java/gson-2.3.1:2.2.2
# com.nimbusds:oauth2-oidc-sdk:4.5 -> >=dev-java/oauth2-oidc-sdk-4.5:0
# commons-codec:commons-codec:1.10 -> >=dev-java/commons-codec-1.11:0
# org.slf4j:slf4j-api:1.7.5 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/commons-codec-1.11:0
	>=dev-java/gson-2.3.1:2.2.2
	>=dev-java/oauth2-oidc-sdk-4.5:0
	>=dev-java/slf4j-api-1.7.7:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.servlet:javax.servlet-api:3.0.1 -> java-virtuals/servlet-api:4.0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		java-virtuals/servlet-api:4.0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="gson-2.2.2,oauth2-oidc-sdk,commons-codec,slf4j-api"
JAVA_CLASSPATH_EXTRA="servlet-api-4.0"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
