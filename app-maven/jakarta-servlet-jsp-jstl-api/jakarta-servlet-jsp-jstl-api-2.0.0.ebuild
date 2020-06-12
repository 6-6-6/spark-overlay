# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.servlet.jsp.jstl-api-2.0.0-RC1.pom --download-uri https://repo.maven.apache.org/maven2/jakarta/servlet/jsp/jstl/jakarta.servlet.jsp.jstl-api/2.0.0-RC1/jakarta.servlet.jsp.jstl-api-2.0.0-RC1-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-servlet-jsp-jstl-api-2.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JavaServer Pages(TM) Standard Tag Library API"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jstl"
SRC_URI="https://repo.maven.apache.org/maven2/jakarta/servlet/jsp/jstl/jakarta.servlet.jsp.jstl-api/${PV}-RC1/jakarta.servlet.jsp.jstl-api-${PV}-RC1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jakarta.servlet.jsp.jstl:jakarta.servlet.jsp.jstl-api:2.0.0-RC1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.servlet.jsp.jstl-api-${PV}-RC1.pom
# jakarta.el:jakarta.el-api:4.0.0-RC1 -> >=app-maven/jakarta-el-api-4.0.0:0
# jakarta.servlet:jakarta.servlet-api:5.0.0-M1 -> >=app-maven/jakarta-servlet-api-5.0.0:0
# jakarta.xml.bind:jakarta.xml.bind-api:3.0.0-RC1 -> >=app-maven/jakarta-xml-bind-api-3.0.0:0

CDEPEND="
	>=app-maven/jakarta-el-api-4.0.0:0
	>=app-maven/jakarta-servlet-api-5.0.0:0
	>=app-maven/jakarta-xml-bind-api-3.0.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.servlet.jsp.jstl-api-${PV}-RC1.pom
# jakarta.servlet.jsp:jakarta.servlet.jsp-api:3.0.0-M1 -> >=app-maven/jakarta-servlet-jsp-api-3.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/jakarta-servlet-jsp-api-3.0.0:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jakarta-el-api,jakarta-servlet-api,jakarta-xml-bind-api"
JAVA_GENTOO_CLASSPATH_EXTRA="jakarta-servlet-jsp-api"
