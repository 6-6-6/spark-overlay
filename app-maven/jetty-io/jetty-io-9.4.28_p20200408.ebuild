# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jetty-io-9.4.28.v20200408.pom --download-uri https://repo.maven.apache.org/maven2/org/eclipse/jetty/jetty-io/9.4.28.v20200408/jetty-io-9.4.28.v20200408-sources.jar --slot 0 --keywords "~amd64" --ebuild jetty-io-9.4.28_p20200408.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Eclipse Jetty Project"
HOMEPAGE="http://www.eclipse.org/jetty"
SRC_URI="https://repo.maven.apache.org/maven2/org/eclipse/jetty/${PN}/9.4.28.v20200408/${PN}-9.4.28.v20200408-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.eclipse.jetty:jetty-io:9.4.28.v20200408"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-9.4.28.v20200408.pom
# org.eclipse.jetty:jetty-util:9.4.28.v20200408 -> >=app-maven/jetty-util-9.4.28_p20200408:0

CDEPEND="
	>=app-maven/jetty-util-9.4.28_p20200408:0
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

JAVA_GENTOO_CLASSPATH="jetty-util"
