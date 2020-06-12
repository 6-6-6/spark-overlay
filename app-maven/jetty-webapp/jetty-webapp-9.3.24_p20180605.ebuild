# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jetty-webapp-9.3.24.v20180605.pom --download-uri https://repo.maven.apache.org/maven2/org/eclipse/jetty/jetty-webapp/9.3.24.v20180605/jetty-webapp-9.3.24.v20180605-sources.jar --slot 0 --keywords "~amd64" --ebuild jetty-webapp-9.3.24_p20180605.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jetty web application support"
HOMEPAGE="http://www.eclipse.org/jetty"
SRC_URI="https://repo.maven.apache.org/maven2/org/eclipse/jetty/${PN}/9.3.24.v20180605/${PN}-9.3.24.v20180605-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.eclipse.jetty:jetty-webapp:9.3.24.v20180605"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-9.3.24.v20180605.pom
# org.eclipse.jetty:jetty-jmx:9.3.24.v20180605 -> >=app-maven/jetty-jmx-9.4.24_p20191120:0
# org.eclipse.jetty:jetty-servlet:9.3.24.v20180605 -> >=app-maven/jetty-servlet-9.3.24_p20180605:0
# org.eclipse.jetty:jetty-xml:9.3.24.v20180605 -> >=app-maven/jetty-xml-9.3.24_p20180605:0

CDEPEND="
	>=app-maven/jetty-jmx-9.4.24_p20191120:0
	>=app-maven/jetty-servlet-9.3.24_p20180605:0
	>=app-maven/jetty-xml-9.3.24_p20180605:0
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

JAVA_GENTOO_CLASSPATH="jetty-jmx,jetty-servlet,jetty-xml"
