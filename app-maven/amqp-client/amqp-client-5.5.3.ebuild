# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/amqp-client-5.5.3.pom --download-uri https://repo1.maven.org/maven2/com/rabbitmq/amqp-client/5.5.3/amqp-client-5.5.3-sources.jar --slot 0 --keywords "~amd64" --ebuild amqp-client-5.5.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The RabbitMQ Java client library allows Java applications to interface with RabbitMQ."
HOMEPAGE="http://www.rabbitmq.com"
SRC_URI="https://repo1.maven.org/maven2/com/rabbitmq/${PN}/${PV}/${P}-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/com/rabbitmq/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.rabbitmq:amqp-client:5.5.3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-databind:2.9.8 -> >=app-maven/jackson-databind-2.10.0:0
# io.dropwizard.metrics:metrics-core:3.2.6 -> >=app-maven/metrics-core-4.1.1:0
# io.micrometer:micrometer-core:1.0.2 -> >=app-maven/micrometer-core-1.0.2:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-1.7.28:0

CDEPEND="
	>=app-maven/jackson-databind-2.10.0:0
	>=app-maven/metrics-core-4.1.1:0
	>=app-maven/micrometer-core-1.0.2:0
	>=dev-java/slf4j-api-1.7.28:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-databind,metrics-core,micrometer-core,slf4j-api"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
