# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/stream-2.9.8.pom --download-uri https://repo.maven.apache.org/maven2/com/clearspring/analytics/stream/2.9.8/stream-2.9.8-sources.jar --slot 0 --keywords "~amd64" --ebuild stream-2.9.8.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A library for summarizing data in streams for which it is infeasible to store all events"
HOMEPAGE="https://github.com/addthis/stream-lib"
SRC_URI="https://repo.maven.apache.org/maven2/com/clearspring/analytics/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.clearspring.analytics:stream:2.9.8"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# it.unimi.dsi:fastutil:8.1.1 -> >=dev-java/fastutil-7.0.10:0
# org.slf4j:slf4j-api:1.7.10 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/fastutil-7.0.10:0
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

JAVA_GENTOO_CLASSPATH="fastutil,slf4j-api"
