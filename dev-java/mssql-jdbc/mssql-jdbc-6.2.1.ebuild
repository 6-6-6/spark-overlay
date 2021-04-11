# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/mssql-jdbc-6.2.1.jre7.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/microsoft/sqlserver/mssql-jdbc/6.2.1.jre7/mssql-jdbc-6.2.1.jre7-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/microsoft/sqlserver/mssql-jdbc/6.2.1.jre7/mssql-jdbc-6.2.1.jre7.jar --slot 0 --keywords "~amd64" --ebuild mssql-jdbc-6.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.microsoft.sqlserver:mssql-jdbc:6.2.1.jre7"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Microsoft JDBC Driver for SQL Server. 		The Azure Key Vault feature in Microsoft JDBC Driver for SQL Server depends on 		Azure SDK for JAVA and Azure Active Directory Library For Java."
HOMEPAGE="https://github.com/Microsoft/mssql-jdbc"
SRC_URI="https://repo1.maven.org/maven2/com/microsoft/sqlserver/${PN}/${PV}.jre7/${P}.jre7-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/microsoft/sqlserver/${PN}/${PV}.jre7/${P}.jre7.jar -> ${P}-bin.jar"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.jre7.pom
# com.microsoft.azure:adal4j:1.1.3 -> >=dev-java/adal4j-1.1.3:0
# com.microsoft.azure:azure-keyvault:0.9.7 -> >=dev-java/azure-keyvault-0.9.7:0

CDEPEND="
	>=dev-java/adal4j-1.1.3:0
	>=dev-java/azure-keyvault-0.9.7:0
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

JAVA_GENTOO_CLASSPATH="adal4j,azure-keyvault"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
