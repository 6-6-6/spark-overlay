# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/log4j-core-2.7.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-core/2.7/log4j-core-2.7-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-core/2.7/log4j-core-2.7.jar --slot 0 --keywords "~amd64" --ebuild log4j-core-2.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.logging.log4j:log4j-core:2.7"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The Apache Log4j Implementation"
HOMEPAGE="http://logging.apache.org/log4j/2.x/log4j-core/"
SRC_URI="https://repo1.maven.org/maven2/org/apache/logging/log4j/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/logging/log4j/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.beust:jcommander:1.48 -> >=dev-java/jcommander-1.48:0
# com.conversantmedia:disruptor:1.2.8-JDK7 -> >=dev-java/conversantmedia-disruptor-1.2.8:0
# com.fasterxml.jackson.core:jackson-core:2.8.3 -> >=dev-java/jackson-2.9.10:2
# com.fasterxml.jackson.core:jackson-databind:2.8.3 -> >=dev-java/jackson-databind-2.10.0:0
# com.fasterxml.jackson.dataformat:jackson-dataformat-xml:2.8.3 -> >=dev-java/jackson-dataformat-xml-2.8.3:0
# com.fasterxml.jackson.dataformat:jackson-dataformat-yaml:2.8.3 -> >=dev-java/jackson-dataformat-yaml-2.8.3:0
# com.fasterxml.woodstox:woodstox-core:5.0.2 -> >=dev-java/woodstox-core-5.0.2:0
# com.lmax:disruptor:3.3.5 -> >=dev-java/disruptor-3.4.2:0
# com.sun.mail:javax.mail:1.5.5 -> >=dev-java/javax-mail-1.5.5:0
# org.apache.commons:commons-compress:1.12 -> >=dev-java/commons-compress-1.20:0
# org.apache.commons:commons-csv:1.4 -> >=dev-java/commons-csv-1.4:0
# org.apache.kafka:kafka-clients:0.10.0.1 -> >=dev-java/kafka-clients-0.10.0.1:0
# org.apache.logging.log4j:log4j-api:2.7 -> >=dev-java/log4j-api-2.7:0
# org.eclipse.persistence:javax.persistence:2.1.0 -> >=dev-java/javax-persistence-2.1.0:0
# org.fusesource.jansi:jansi:1.13 -> >=dev-java/jansi-1.13:0
# org.jctools:jctools-core:1.2.1 -> >=dev-java/jctools-core-1.2.1:0
# org.zeromq:jeromq:0.3.5 -> >=dev-java/jeromq-0.3.5:0

CDEPEND="
	>=dev-java/commons-csv-1.4:0
	>=dev-java/conversantmedia-disruptor-1.2.8:0
	>=dev-java/jctools-core-1.2.1:0
	>=dev-java/jeromq-0.3.5:0
	>=dev-java/kafka-clients-0.10.0.1:0
	>=dev-java/woodstox-core-5.0.2:0
	>=dev-java/commons-compress-1.20:0
	>=dev-java/disruptor-3.4.2:0
	>=dev-java/jackson-2.9.10:2
	>=dev-java/jackson-databind-2.10.0:0
	>=dev-java/jackson-dataformat-xml-2.8.3:0
	>=dev-java/jackson-dataformat-yaml-2.8.3:0
	>=dev-java/jansi-1.13:0
	>=dev-java/javax-mail-1.5.5:0
	>=dev-java/javax-persistence-2.1.0:0
	>=dev-java/jcommander-1.48:0
	>=dev-java/log4j-api-2.7:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.jboss.spec.javax.jms:jboss-jms-api_1.1_spec:1.0.1.Final -> >=dev-java/jboss-jms-api-1.0.1:1.1_spec
# org.osgi:org.osgi.core:4.3.1 -> >=dev-java/osgi-core-api-5.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/jboss-jms-api-1.0.1:1.1_spec
		>=dev-java/osgi-core-api-5.0.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jcommander,conversantmedia-disruptor,jackson-2,jackson-databind,jackson-dataformat-xml,jackson-dataformat-yaml,woodstox-core,disruptor,javax-mail,commons-compress,commons-csv,kafka-clients,log4j-api,javax-persistence,jansi,jctools-core,jeromq"
JAVA_CLASSPATH_EXTRA="jboss-jms-api-1.1_spec,osgi-core-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
