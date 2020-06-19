# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/amqp-client-5.9.0.pom --download-uri https://repo.maven.apache.org/maven2/com/rabbitmq/amqp-client/5.9.0/amqp-client-5.9.0-sources.jar --slot 0 --keywords "~amd64" --ebuild amqp-client-5.9.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The RabbitMQ Java client library allows Java applications to interface with RabbitMQ."
HOMEPAGE="https://www.rabbitmq.com"
SRC_URI="https://repo.maven.apache.org/maven2/com/rabbitmq/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.rabbitmq:amqp-client:5.9.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-databind:2.10.3 -> >=dev-java/jackson-databind-2.11.0:2
# io.dropwizard.metrics:metrics-core:4.1.5 -> >=app-maven/metrics-core-4.1.9:0
# io.micrometer:micrometer-core:1.4.1 -> >=app-maven/micrometer-core-1.5.1:0
# org.slf4j:slf4j-api:1.7.30 -> >=dev-java/slf4j-api-2.0.0_alpha1:0

CDEPEND="
	>=app-maven/metrics-core-4.1.9:0
	>=app-maven/micrometer-core-1.5.1:0
	>=dev-java/jackson-databind-2.11.0:2
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

JAVA_GENTOO_CLASSPATH="jackson-databind-2,metrics-core,micrometer-core,slf4j-api"
