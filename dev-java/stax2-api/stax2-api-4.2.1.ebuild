# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/stax2-api-4.2.1.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/woodstox/stax2-api/4.2.1/stax2-api-4.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild stax2-api-4.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="tax2 API is an extension to basic Stax 1.0 API that adds significant new functionality, such as full-featured bi-direction validation interface and high-performance Typed Access API."
HOMEPAGE="http://github.com/FasterXML/stax2-api"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/woodstox/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.woodstox:stax2-api:4.2.1"



DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

