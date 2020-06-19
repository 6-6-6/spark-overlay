# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.transaction-api-2.0.0-RC1.pom --download-uri https://repo.maven.apache.org/maven2/jakarta/transaction/jakarta.transaction-api/2.0.0-RC1/jakarta.transaction-api-2.0.0-RC1-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-transaction-api-2.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta Transactions"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jta"
SRC_URI="https://repo.maven.apache.org/maven2/jakarta/transaction/jakarta.transaction-api/${PV}-RC1/jakarta.transaction-api-${PV}-RC1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jakarta.transaction:jakarta.transaction-api:2.0.0-RC1"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.transaction-api-${PV}-RC1.pom
# jakarta.enterprise:jakarta.enterprise.cdi-api:3.0.0-M1 -> >=app-maven/jakarta-enterprise-cdi-api-3.0.0:0
# jakarta.interceptor:jakarta.interceptor-api:2.0.0-RC1 -> >=app-maven/jakarta-interceptor-api-2.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=app-maven/jakarta-enterprise-cdi-api-3.0.0:0
	>=app-maven/jakarta-interceptor-api-2.0.0:0
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jakarta-enterprise-cdi-api,jakarta-interceptor-api"
