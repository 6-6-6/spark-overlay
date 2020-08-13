# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/log4j-core-2.3.pom --download-uri https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-core/2.3/log4j-core-2.3-sources.jar --slot 0 --keywords "~amd64" --ebuild log4j-core-2.3-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.logging.log4j:log4j-core:2.3"

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
# com.fasterxml.jackson.core:jackson-core:2.5.3 -> >=dev-java/jackson-2.9.10:2
# com.fasterxml.jackson.core:jackson-databind:2.5.3 -> >=dev-java/jackson-databind-2.10.0:0
# com.fasterxml.jackson.dataformat:jackson-dataformat-xml:2.5.3 -> >=dev-java/jackson-dataformat-xml-2.5.3:0
# com.fasterxml.jackson.dataformat:jackson-dataformat-yaml:2.5.3 -> >=dev-java/jackson-dataformat-yaml-2.5.3:0
# com.lmax:disruptor:3.3.2 -> >=dev-java/disruptor-3.4.2:0
# com.sun.mail:javax.mail:1.5.2 -> >=dev-java/javax-mail-1.5.2:0
# org.apache.logging.log4j:log4j-api:2.3 -> >=dev-java/log4j-api-2.3:0
# org.codehaus.woodstox:woodstox-core-asl:4.3.0 -> >=dev-java/woodstox-core-asl-4.3.0:0
# org.eclipse.persistence:javax.persistence:2.1.0 -> >=dev-java/javax-persistence-2.1.0:0
# org.fusesource.jansi:jansi:1.11 -> >=dev-java/jansi-1.11:1.11

CDEPEND="
	>=dev-java/jackson-databind-2.10.0:0
	>=dev-java/jackson-dataformat-xml-2.5.3:0
	>=dev-java/jackson-dataformat-yaml-2.5.3:0
	>=dev-java/javax-mail-1.5.2:0
	>=dev-java/javax-persistence-2.1.0:0
	>=dev-java/log4j-api-2.3:0
	>=dev-java/woodstox-core-asl-4.3.0:0
	>=dev-java/disruptor-3.4.2:0
	>=dev-java/jackson-2.9.10:2
	>=dev-java/jansi-1.11:1.11
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
	test? (
		amd64? (
			dev-util/japi-compliance-checker
			dev-util/pkgdiff
		)
	)"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-2,jackson-databind,jackson-dataformat-xml,jackson-dataformat-yaml,disruptor,javax-mail,log4j-api,woodstox-core-asl,javax-persistence,jansi-1.11"
JAVA_CLASSPATH_EXTRA="jboss-jms-api-1.1_spec,osgi-core-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_TESTING_FRAMEWORKS="pkgdiff"
