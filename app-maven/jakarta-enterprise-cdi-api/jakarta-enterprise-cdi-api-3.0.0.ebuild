# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.enterprise.cdi-api-3.0.0-M4.pom --download-uri https://repo.maven.apache.org/maven2/jakarta/enterprise/jakarta.enterprise.cdi-api/3.0.0-M4/jakarta.enterprise.cdi-api-3.0.0-M4-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-enterprise-cdi-api-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="APIs for CDI (Contexts and Dependency Injection for Java)"
HOMEPAGE="http://cdi-spec.org"
SRC_URI="https://repo.maven.apache.org/maven2/jakarta/enterprise/jakarta.enterprise.cdi-api/${PV}-M4/jakarta.enterprise.cdi-api-${PV}-M4-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jakarta.enterprise:jakarta.enterprise.cdi-api:3.0.0-M4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.enterprise.cdi-api-${PV}-M4.pom
# jakarta.el:jakarta.el-api:4.0.0-RC1 -> >=app-maven/jakarta-el-api-4.0.0:0
# jakarta.inject:jakarta.inject-api:2.0.0-RC4 -> >=app-maven/jakarta-inject-api-2.0.0:0
# jakarta.interceptor:jakarta.interceptor-api:2.0.0-RC2 -> >=app-maven/jakarta-interceptor-api-2.0.0:0

CDEPEND="
	>=app-maven/jakarta-el-api-4.0.0:0
	>=app-maven/jakarta-inject-api-2.0.0:0
	>=app-maven/jakarta-interceptor-api-2.0.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.enterprise.cdi-api-${PV}-M4.pom
# jakarta.ejb:jakarta.ejb-api:4.0.0-RC2 -> >=app-maven/jakarta-ejb-api-4.0.0:0
# jakarta.transaction:jakarta.transaction-api:2.0.0-RC1 -> >=app-maven/jakarta-transaction-api-2.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/jakarta-ejb-api-4.0.0:0
	>=app-maven/jakarta-transaction-api-2.0.0:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jakarta-el-api,jakarta-inject-api,jakarta-interceptor-api"
JAVA_GENTOO_CLASSPATH_EXTRA="jakarta-ejb-api,jakarta-transaction-api"
