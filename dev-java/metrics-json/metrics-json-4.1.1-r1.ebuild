# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/metrics-json-4.1.1.pom --download-uri https://repo1.maven.org/maven2/io/dropwizard/metrics/metrics-json/4.1.1/metrics-json-4.1.1-sources.jar --slot 0 --keywords "~amd64" --ebuild metrics-json-4.1.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="io.dropwizard.metrics:metrics-json:4.1.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="A set of Jackson modules which provide serializers for most Metrics classes."
HOMEPAGE="http://metrics.dropwizard.io/metrics-json"
SRC_URI="https://repo1.maven.org/maven2/io/dropwizard/metrics/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/io/dropwizard/metrics/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-databind:2.9.9.3 -> >=dev-java/jackson-databind-2.10.0:0
# io.dropwizard.metrics:metrics-core:4.1.1 -> >=dev-java/metrics-core-4.1.1:0
# io.dropwizard.metrics:metrics-healthchecks:4.1.1 -> >=dev-java/metrics-healthchecks-4.1.1:0
# org.slf4j:slf4j-api:1.7.28 -> >=dev-java/slf4j-api-1.7.28:0

CDEPEND="
	>=dev-java/jackson-databind-2.10.0:0
	>=dev-java/metrics-core-4.1.1:0
	>=dev-java/metrics-healthchecks-4.1.1:0
	>=dev-java/slf4j-api-1.7.28:0
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

JAVA_GENTOO_CLASSPATH="jackson-databind,metrics-core,metrics-healthchecks,slf4j-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
