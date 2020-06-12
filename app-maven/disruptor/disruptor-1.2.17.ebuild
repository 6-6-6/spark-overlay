# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/disruptor-1.2.17.pom --download-uri https://repo.maven.apache.org/maven2/com/conversantmedia/disruptor/1.2.17/disruptor-1.2.17-sources.jar --slot 0 --keywords "~amd64" --ebuild disruptor-1.2.17.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Conversant Disruptor - very high throughput Java BlockingQueue"
HOMEPAGE="https://github.com/conversant/disruptor"
SRC_URI="https://repo.maven.apache.org/maven2/com/conversantmedia/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.conversantmedia:disruptor:1.2.17"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.slf4j:slf4j-api:1.7.13 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/slf4j-api-1.7.7:0
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

JAVA_GENTOO_CLASSPATH="slf4j-api"
