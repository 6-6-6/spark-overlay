# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jsp-api-2.2.1-b03.pom --download-uri https://repo.maven.apache.org/maven2/javax/servlet/jsp/jsp-api/2.2.1-b03/jsp-api-2.2.1-b03-sources.jar --slot 0 --keywords "~amd64" --ebuild jsp-api-2.2.1_beta03.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION=""
HOMEPAGE="http://java.net/projects/jsp/jsp-api"
SRC_URI="https://repo.maven.apache.org/maven2/javax/servlet/jsp/${PN}/2.2.1-b03/${PN}-2.2.1-b03-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="javax.servlet.jsp:jsp-api:2.2.1-b03"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-2.2.1-b03.pom
# javax.el:el-api:2.2 -> >=app-maven/el-api-2.2.1_beta04:0
# org.glassfish:javax.servlet:3.0-b72 -> >=java-virtuals/servlet-api-2.3:2.3

DEPEND="
	>=virtual/jdk-1.5:*
	app-arch/unzip
	>=app-maven/el-api-2.2.1_beta04:0
	>=java-virtuals/servlet-api-2.3:2.3
"

RDEPEND="
	>=virtual/jre-1.5:*
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH_EXTRA="el-api,servlet-api-2.3"
