# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.faces-3.0.0-RC1.pom --download-uri https://repo.maven.apache.org/maven2/org/glassfish/jakarta.faces/3.0.0-RC1/jakarta.faces-3.0.0-RC1-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-faces-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="EE4J Compatible Implementation for Jakarta Faces API"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j/mojarra-parent/jakarta.faces"
SRC_URI="https://repo.maven.apache.org/maven2/org/glassfish/jakarta.faces/${PV}-RC1/jakarta.faces-${PV}-RC1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish:jakarta.faces:3.0.0-RC1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.faces-${PV}-RC1.pom
# jakarta.annotation:jakarta.annotation-api:2.0.0-RC1 -> >=app-maven/jakarta-annotation-api-2.0.0:0

CDEPEND="
	>=app-maven/jakarta-annotation-api-2.0.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.faces-${PV}-RC1.pom
# jakarta.ejb:jakarta.ejb-api:4.0.0-RC1 -> >=app-maven/jakarta-ejb-api-4.0.0:0
# jakarta.el:jakarta.el-api:4.0.0-RC1 -> >=app-maven/jakarta-el-api-4.0.0:0
# jakarta.enterprise:jakarta.enterprise.cdi-api:3.0.0-M1 -> >=app-maven/jakarta-enterprise-cdi-api-3.0.0:0
# jakarta.json:jakarta.json-api:2.0.0-RC2 -> >=app-maven/jakarta-json-api-2.0.0:0
# jakarta.persistence:jakarta.persistence-api:3.0.0-RC1 -> >=app-maven/jakarta-persistence-api-3.0.0:0
# jakarta.servlet:jakarta.servlet-api:5.0.0-M1 -> >=app-maven/jakarta-servlet-api-5.0.0:0
# jakarta.servlet.jsp:jakarta.servlet.jsp-api:3.0.0-M1 -> >=app-maven/jakarta-servlet-jsp-api-3.0.0:0
# jakarta.servlet.jsp.jstl:jakarta.servlet.jsp.jstl-api:2.0.0-RC1 -> >=app-maven/jakarta-servlet-jsp-jstl-api-2.0.0:0
# jakarta.transaction:jakarta.transaction-api:1.3.2 -> >=app-maven/jakarta-transaction-api-2.0.0:0
# jakarta.validation:jakarta.validation-api:3.0.0-M1 -> >=app-maven/jakarta-validation-api-3.0.0:0
# jakarta.websocket:jakarta.websocket-api:2.0.0-M1 -> >=app-maven/jakarta-websocket-api-2.0.0:0
# jakarta.xml.ws:jakarta.xml.ws-api:3.0.0-RC1 -> >=app-maven/jakarta-xml-ws-api-3.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/jakarta-ejb-api-4.0.0:0
	>=app-maven/jakarta-el-api-4.0.0:0
	>=app-maven/jakarta-enterprise-cdi-api-3.0.0:0
	>=app-maven/jakarta-json-api-2.0.0:0
	>=app-maven/jakarta-persistence-api-3.0.0:0
	>=app-maven/jakarta-servlet-api-5.0.0:0
	>=app-maven/jakarta-servlet-jsp-api-3.0.0:0
	>=app-maven/jakarta-servlet-jsp-jstl-api-2.0.0:0
	>=app-maven/jakarta-transaction-api-2.0.0:0
	>=app-maven/jakarta-validation-api-3.0.0:0
	>=app-maven/jakarta-websocket-api-2.0.0:0
	>=app-maven/jakarta-xml-ws-api-3.0.0:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jakarta-annotation-api"
JAVA_GENTOO_CLASSPATH_EXTRA="jakarta-ejb-api,jakarta-el-api,jakarta-enterprise-cdi-api,jakarta-json-api,jakarta-persistence-api,jakarta-servlet-api,jakarta-servlet-jsp-api,jakarta-servlet-jsp-jstl-api,jakarta-transaction-api,jakarta-validation-api,jakarta-websocket-api,jakarta-xml-ws-api"
