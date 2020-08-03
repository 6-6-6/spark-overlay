# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/alpn-api-1.1.3.v20160715.pom --download-uri https://repo.maven.apache.org/maven2/org/eclipse/jetty/alpn/alpn-api/1.1.3.v20160715/alpn-api-1.1.3.v20160715-sources.jar --slot 0 --keywords "~amd64" --ebuild alpn-api-1.1.3_p20160715.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.eclipse.jetty.alpn:alpn-api:1.1.3.v20160715"

inherit java-pkg-2 java-pkg-simple

MY_PN="alpn-api"

DESCRIPTION="Administrative parent pom for Jetty modules"
HOMEPAGE="http://www.eclipse.org/jetty/alpn-api"
SRC_URI="https://repo.maven.apache.org/maven2/org/eclipse/jetty/alpn/${MY_PN}/1.1.3.v20160715/${MY_PN}-1.1.3.v20160715-sources.jar"
LICENSE="Apache-2.0 EPL-1.0"
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
