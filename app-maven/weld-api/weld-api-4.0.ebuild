# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/weld-api-4.0.Alpha1.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/weld/weld-api/4.0.Alpha1/weld-api-4.0.Alpha1-sources.jar --slot 0 --keywords "~amd64" --ebuild weld-api-4.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Weld specifc extensions to the CDI API"
HOMEPAGE="http://weld.cdi-spec.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/weld/${PN}/${PV}.Alpha1/${P}.Alpha1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.weld:weld-api:4.0.Alpha1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha1.pom
# jakarta.enterprise:jakarta.enterprise.cdi-api:3.0.0-M2 -> >=app-maven/jakarta-enterprise-cdi-api-3.0.0:0
# jakarta.interceptor:jakarta.interceptor-api:2.0.0-RC2 -> >=app-maven/jakarta-interceptor-api-2.0.0:0
# jakarta.servlet:jakarta.servlet-api:5.0.0-M1 -> >=app-maven/jakarta-servlet-api-5.0.0:0

CDEPEND="
	>=app-maven/jakarta-enterprise-cdi-api-3.0.0:0
	>=app-maven/jakarta-interceptor-api-2.0.0:0
	>=app-maven/jakarta-servlet-api-5.0.0:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jakarta-enterprise-cdi-api,jakarta-interceptor-api,jakarta-servlet-api"
