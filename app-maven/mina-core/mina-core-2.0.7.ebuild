# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/mina-core-2.0.7.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/mina/mina-core/2.0.7/mina-core-2.0.7-sources.jar --slot 0 --keywords "~amd64" --ebuild mina-core-2.0.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache MINA is a network application framework which helps users develop high performance and highly scalable network applications easily.  It provides an abstract event-driven asynchronous API over various transports such as TCP/IP and UDP/IP via Java NIO."
HOMEPAGE="http://mina.apache.org/mina-core/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/mina/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.mina:mina-core:2.0.7"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.slf4j:slf4j-api:1.6.6 -> >=dev-java/slf4j-ext-1.7.5:0

CDEPEND="
	>=dev-java/slf4j-ext-1.7.5:0
"


DEPEND="
	>=virtual/jdk-1.5:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="slf4j-ext"
