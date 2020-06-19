# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.servlet.jsp-api-3.0.0-M1.pom --download-uri https://repo.maven.apache.org/maven2/jakarta/servlet/jsp/jakarta.servlet.jsp-api/3.0.0-M1/jakarta.servlet.jsp-api-3.0.0-M1-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-servlet-jsp-api-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta Server Pages API"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jsp"
SRC_URI="https://repo.maven.apache.org/maven2/jakarta/servlet/jsp/jakarta.servlet.jsp-api/${PV}-M1/jakarta.servlet.jsp-api-${PV}-M1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jakarta.servlet.jsp:jakarta.servlet.jsp-api:3.0.0-M1"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.servlet.jsp-api-${PV}-M1.pom
# jakarta.el:jakarta.el-api:4.0.0-RC1 -> >=app-maven/jakarta-el-api-4.0.0:0
# jakarta.servlet:jakarta.servlet-api:5.0.0-M1 -> >=app-maven/jakarta-servlet-api-5.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=app-maven/jakarta-el-api-4.0.0:0
	>=app-maven/jakarta-servlet-api-5.0.0:0
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jakarta-el-api,jakarta-servlet-api"
