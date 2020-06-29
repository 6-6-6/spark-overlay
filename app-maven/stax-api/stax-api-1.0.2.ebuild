# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/stax-api-1.0-2.pom --download-uri https://repo.maven.apache.org/maven2/javax/xml/stream/stax-api/1.0-2/stax-api-1.0-2-sources.jar --slot 0 --keywords "~amd64" --ebuild stax-api-1.0.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="StAX is a standard XML processing API that allows you to stream XML data from and to your application."
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/javax/xml/stream/${PN}/1.0-2/${PN}-1.0-2-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="javax.xml.stream:stax-api:1.0-2"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

