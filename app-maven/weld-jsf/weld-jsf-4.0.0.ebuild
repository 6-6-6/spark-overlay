# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/weld-jsf-4.0.0.Alpha2.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/weld/module/weld-jsf/4.0.0.Alpha2/weld-jsf-4.0.0.Alpha2-sources.jar --slot 0 --keywords "~amd64" --ebuild weld-jsf-4.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Weld JSF support"
HOMEPAGE="http://weld.cdi-spec.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/weld/module/${PN}/${PV}.Alpha2/${P}.Alpha2-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.weld.module:weld-jsf:4.0.0.Alpha2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha2.pom
# com.github.spotbugs:spotbugs-annotations:3.1.11 -> >=app-maven/spotbugs-annotations-4.0.3:0
# jakarta.enterprise:jakarta.enterprise.cdi-api:3.0.0-M2 -> >=app-maven/jakarta-enterprise-cdi-api-3.0.0:0
# jakarta.faces:jakarta.faces-api:3.0.0-RC1 -> >=app-maven/jakarta-faces-api-3.0.0:0
# jakarta.servlet:jakarta.servlet-api:5.0.0-M1 -> >=app-maven/jakarta-servlet-api-5.0.0:0
# org.jboss.weld:weld-api:4.0.Alpha1 -> >=app-maven/weld-api-4.0:0
# org.jboss.weld:weld-core-impl:4.0.0.Alpha2 -> >=app-maven/weld-core-impl-4.0.0:0
# org.jboss.weld:weld-spi:4.0.Alpha1 -> >=app-maven/weld-spi-4.0:0

CDEPEND="
	>=app-maven/jakarta-enterprise-cdi-api-3.0.0:0
	>=app-maven/jakarta-faces-api-3.0.0:0
	>=app-maven/jakarta-servlet-api-5.0.0:0
	>=app-maven/spotbugs-annotations-4.0.3:0
	>=app-maven/weld-api-4.0:0
	>=app-maven/weld-core-impl-4.0.0:0
	>=app-maven/weld-spi-4.0:0
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

JAVA_GENTOO_CLASSPATH="spotbugs-annotations,jakarta-enterprise-cdi-api,jakarta-faces-api,jakarta-servlet-api,weld-api,weld-core-impl,weld-spi"
