# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/log4j-core-2.13.3.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/logging/log4j/log4j-core/2.13.3/log4j-core-2.13.3-sources.jar --slot 0 --keywords "~amd64" --ebuild log4j-core-2.13.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Apache Log4j Implementation"
HOMEPAGE="https://logging.apache.org/log4j/2.x/log4j-core/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/logging/log4j/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.logging.log4j:log4j-core:2.13.3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.conversantmedia:disruptor:1.2.15 -> >=app-maven/disruptor-1.2.17:0
# com.fasterxml.jackson.core:jackson-core:2.10.2 -> >=dev-java/jackson-2.11.0:2
# com.fasterxml.jackson.core:jackson-databind:2.10.2 -> >=dev-java/jackson-databind-2.11.0:2
# com.fasterxml.jackson.dataformat:jackson-dataformat-xml:2.10.2 -> >=app-maven/jackson-dataformat-xml-2.11.0:0
# com.fasterxml.jackson.dataformat:jackson-dataformat-yaml:2.10.2 -> >=app-maven/jackson-dataformat-yaml-2.11.0:0
# com.fasterxml.woodstox:woodstox-core:5.0.3 -> >=app-maven/woodstox-core-6.2.1:0
# com.lmax:disruptor:3.4.2 -> >=dev-java/disruptor-3.4.2:0
# com.sun.mail:javax.mail:1.6.2 -> >=dev-java/oracle-javamail-1.6.2:0
# org.apache.commons:commons-compress:1.19 -> >=dev-java/commons-compress-1.20:0
# org.apache.commons:commons-csv:1.7 -> >=app-maven/commons-csv-1.8:0
# org.apache.kafka:kafka-clients:1.1.1 -> >=app-maven/kafka-clients-2.5.0:0
# org.apache.logging.log4j:log4j-api:2.13.3 -> >=app-maven/log4j-api-2.13.3:0
# org.fusesource.jansi:jansi:1.17.1 -> >=dev-java/jansi-1.18:0
# org.jctools:jctools-core:1.2.1 -> >=app-maven/jctools-core-3.0.0:0
# org.zeromq:jeromq:0.4.3 -> >=app-maven/jeromq-0.5.2:0

CDEPEND="
	>=app-maven/commons-csv-1.8:0
	>=app-maven/disruptor-1.2.17:0
	>=app-maven/jackson-dataformat-xml-2.11.0:0
	>=app-maven/jackson-dataformat-yaml-2.11.0:0
	>=app-maven/jctools-core-3.0.0:0
	>=app-maven/jeromq-0.5.2:0
	>=app-maven/kafka-clients-2.5.0:0
	>=app-maven/log4j-api-2.13.3:0
	>=app-maven/woodstox-core-6.2.1:0
	>=dev-java/commons-compress-1.20:0
	>=dev-java/disruptor-3.4.2:0
	>=dev-java/jackson-2.11.0:2
	>=dev-java/jackson-databind-2.11.0:2
	>=dev-java/jansi-1.18:0
	>=dev-java/oracle-javamail-1.6.2:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.jboss.spec.javax.jms:jboss-jms-api_1.1_spec:1.0.1.Final -> >=app-maven/jboss-jms-api-1.0.1:1.1_spec
# org.osgi:org.osgi.core:4.3.1 -> >=dev-java/osgi-core-6.0.0:6

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/jboss-jms-api-1.0.1:1.1_spec
	>=dev-java/osgi-core-6.0.0:6
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="disruptor,jackson-2,jackson-databind-2,jackson-dataformat-xml,jackson-dataformat-yaml,woodstox-core,disruptor,oracle-javamail,commons-compress,commons-csv,kafka-clients,log4j-api,jansi,jctools-core,jeromq"
JAVA_CLASSPATH_EXTRA="jboss-jms-api-1.1_spec,osgi-core-6"
