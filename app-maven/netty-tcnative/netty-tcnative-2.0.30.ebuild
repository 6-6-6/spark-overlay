# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-tcnative-2.0.30.Final.pom --download-uri https://repo.maven.apache.org/maven2/io/netty/netty-tcnative/2.0.30.Final/netty-tcnative-2.0.30.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild netty-tcnative-2.0.30.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A Mavenized fork of Tomcat Native which incorporates various patches. This artifact is dynamically linked
    to OpenSSL and Apache APR."
HOMEPAGE="https://github.com/netty/netty-tcnative/netty-tcnative/"
SRC_URI="https://repo.maven.apache.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.netty:netty-tcnative:2.0.30.Final"



DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

