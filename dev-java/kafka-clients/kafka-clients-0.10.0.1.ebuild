# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/kafka-clients-0.10.0.1.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/apache/kafka/kafka-clients/0.10.0.1/kafka-clients-0.10.0.1-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/apache/kafka/kafka-clients/0.10.0.1/kafka-clients-0.10.0.1.jar --slot 0 --keywords "~amd64" --ebuild kafka-clients-0.10.0.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MAVEN_ID="org.apache.kafka:kafka-clients:0.10.0.1"
DESCRIPTION="${MAVEN_ID}"
HOMEPAGE="http://kafka.apache.org"
SRC_URI="https://repo1.maven.org/maven2/org/apache/kafka/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/kafka/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# net.jpountz.lz4:lz4:1.3.0 -> >=dev-java/lz4-java-1.3.0:0
# org.slf4j:slf4j-api:1.7.21 -> >=dev-java/slf4j-api-1.7.28:0
# org.xerial.snappy:snappy-java:1.1.2.6 -> >=dev-java/snappy-1.1.7.5:1.1

CDEPEND="
	>=dev-java/lz4-java-1.3.0:0
	>=dev-java/slf4j-api-1.7.28:0
	>=dev-java/snappy-1.1.7.5:1.1
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
	test? (

		amd64? (
			dev-util/pkgdiff
			dev-util/japi-compliance-checker
		)
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="lz4-java,slf4j-api,snappy-1.1"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TESTING_FRAMEWORKS="pkgdiff"
