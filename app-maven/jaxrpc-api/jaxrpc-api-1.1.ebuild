# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jaxrpc-api-1.1.pom --download-uri https://repo.maven.apache.org/maven2/javax/xml/jaxrpc-api/1.1/jaxrpc-api-1.1.jar --slot 0 --keywords "~amd64" --ebuild jaxrpc-api-1.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Part of the Java Web Services Developer Pack 1.6"
HOMEPAGE="http://java.sun.com/webservices/jaxrpc/index.jsp"
SRC_URI="https://repo.maven.apache.org/maven2/javax/xml/${PN}/${PV}/${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="javax.xml:jaxrpc-api:1.1"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
