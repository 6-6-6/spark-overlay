# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/httpcore5-5.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/httpcomponents/core5/httpcore5/5.0/httpcore5-5.0-sources.jar --slot 0 --keywords "~amd64" --ebuild httpcore5-5.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache HttpComponents HTTP/1.1 core components"
HOMEPAGE="http://hc.apache.org/httpcomponents-core-ga"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/httpcomponents/core5/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.httpcomponents.core5:httpcore5:5.0"



DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.7:*
"

S="${WORKDIR}"

