# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/npn-api-8.1.2.v20120308.pom --download-uri https://repo.maven.apache.org/maven2/org/eclipse/jetty/npn/npn-api/8.1.2.v20120308/npn-api-8.1.2.v20120308-sources.jar --slot 0 --keywords "~amd64" --ebuild npn-api-8.1.2_p20120308.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.eclipse.jetty.npn:npn-api:1.1.1.v20141010"

inherit java-pkg-2 java-pkg-simple

MY_PN="npn-api"

DESCRIPTION="Administrative parent pom for Jetty modules"
HOMEPAGE="http://www.eclipse.org/jetty/npn-api"
SRC_URI="https://repo.maven.apache.org/maven2/org/eclipse/jetty/npn/${MY_PN}/1.1.1.v20141010/${MY_PN}-1.1.1.v20141010-sources.jar"
LICENSE="EPL-1.0 Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"
