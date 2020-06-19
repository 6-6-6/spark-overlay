# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/connect-api-2.5.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/kafka/connect-api/2.5.0/connect-api-2.5.0-sources.jar --slot 0 --keywords "~amd64" --ebuild connect-api-2.5.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION=""
HOMEPAGE="https://kafka.apache.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/kafka/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.kafka:connect-api:2.5.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.ws.rs:javax.ws.rs-api:2.1.1 -> >=app-maven/javax-ws-rs-api-2.1.1:0
# org.apache.kafka:kafka-clients:2.5.0 -> >=app-maven/kafka-clients-2.5.0:0
# org.slf4j:slf4j-api:1.7.30 -> >=dev-java/slf4j-api-2.0.0_alpha1:0

CDEPEND="
	>=app-maven/javax-ws-rs-api-2.1.1:0
	>=app-maven/kafka-clients-2.5.0:0
	>=dev-java/slf4j-api-2.0.0_alpha1:0
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

JAVA_GENTOO_CLASSPATH="javax-ws-rs-api,kafka-clients,slf4j-api"
