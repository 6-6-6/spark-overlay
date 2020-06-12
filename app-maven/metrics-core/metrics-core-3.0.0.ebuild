# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/metrics-core-3.0.0-BETA1.pom --download-uri https://repo.maven.apache.org/maven2/com/yammer/metrics/metrics-core/3.0.0-BETA1/metrics-core-3.0.0-BETA1-sources.jar --slot 0 --keywords "~amd64" --ebuild metrics-core-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Yammer's Metrics library."
HOMEPAGE="http://metrics.codahale.com/metrics-core/"
SRC_URI="https://repo.maven.apache.org/maven2/com/yammer/metrics/${PN}/${PV}-BETA1/${P}-BETA1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.yammer.metrics:metrics-core:3.0.0-BETA1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-BETA1.pom
# org.slf4j:slf4j-api:1.7.5 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/slf4j-api-1.7.7:0
"


DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="slf4j-api"
