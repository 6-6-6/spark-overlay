# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jetty-http-9.4.8.v20171121.pom --download-uri https://repo.maven.apache.org/maven2/org/eclipse/jetty/jetty-http/9.4.8.v20171121/jetty-http-9.4.8.v20171121-sources.jar --slot 0 --keywords "~amd64" --ebuild jetty-http-9.4.8_p20171121.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Eclipse Jetty Project"
HOMEPAGE="http://www.eclipse.org/jetty"
SRC_URI="https://repo.maven.apache.org/maven2/org/eclipse/jetty/${PN}/9.4.8.v20171121/${PN}-9.4.8.v20171121-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.eclipse.jetty:jetty-http:9.4.8.v20171121"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-9.4.8.v20171121.pom
# org.eclipse.jetty:jetty-io:9.4.8.v20171121 -> >=app-maven/jetty-io-9.4.8_p20171121:0
# org.eclipse.jetty:jetty-util:9.4.8.v20171121 -> >=app-maven/jetty-util-9.4.8_p20171121:0

CDEPEND="
	>=app-maven/jetty-io-9.4.8_p20171121:0
	>=app-maven/jetty-util-9.4.8_p20171121:0
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

JAVA_GENTOO_CLASSPATH="jetty-io,jetty-util"
