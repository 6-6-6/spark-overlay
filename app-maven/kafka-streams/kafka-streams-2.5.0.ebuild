# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/kafka-streams-2.5.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/kafka/kafka-streams/2.5.0/kafka-streams-2.5.0-sources.jar --slot 0 --keywords "~amd64" --ebuild kafka-streams-2.5.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION=""
HOMEPAGE="https://kafka.apache.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/kafka/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.kafka:kafka-streams:2.5.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.kafka:connect-json:2.5.0 -> >=app-maven/connect-json-2.5.0:0
# org.apache.kafka:kafka-clients:2.5.0 -> >=app-maven/kafka-clients-2.5.0:0
# org.rocksdb:rocksdbjni:5.18.3 -> >=app-maven/rocksdbjni-6.8.1:0
# org.slf4j:slf4j-api:1.7.30 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=app-maven/connect-json-2.5.0:0
	>=app-maven/kafka-clients-2.5.0:0
	>=app-maven/rocksdbjni-6.8.1:0
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

JAVA_GENTOO_CLASSPATH="connect-json,kafka-clients,rocksdbjni,slf4j-api"
