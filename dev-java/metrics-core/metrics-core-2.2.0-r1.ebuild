# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/metrics-core-2.2.0.pom --download-uri https://repo1.maven.org/maven2/com/yammer/metrics/metrics-core/2.2.0/metrics-core-2.2.0-sources.jar --slot 0 --keywords "~amd64" --ebuild metrics-core-2.2.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.yammer.metrics:metrics-core:2.2.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Yammer's Metrics library."
HOMEPAGE="http://metrics.codahale.com/metrics-core/"
SRC_URI="https://repo1.maven.org/maven2/com/yammer/metrics/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/yammer/metrics/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.slf4j:slf4j-api:1.7.2 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/slf4j-api-1.7.7:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="slf4j-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
