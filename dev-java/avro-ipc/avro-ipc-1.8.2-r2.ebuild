# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/avro-ipc-1.8.2.pom --download-uri https://repo1.maven.org/maven2/org/apache/avro/avro-ipc/1.8.2/avro-ipc-1.8.2-sources.jar --slot 0 --keywords "~amd64" --ebuild avro-ipc-1.8.2-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.avro:avro-ipc:1.8.2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Avro inter-process communication components"
HOMEPAGE="http://avro.apache.org"
SRC_URI="https://repo1.maven.org/maven2/org/apache/avro/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/avro/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# io.netty:netty:3.5.13.Final -> dev-java/netty:3.10
# org.apache.avro:avro:1.8.2 -> >=dev-java/avro-1.8.2:0
# org.apache.velocity:velocity:1.7 -> >=dev-java/velocity-1.7:0
# org.codehaus.jackson:jackson-core-asl:1.9.13 -> >=dev-java/jackson-core-asl-1.9.13:0
# org.codehaus.jackson:jackson-mapper-asl:1.9.13 -> >=dev-java/jackson-mapper-asl-1.9.13:0
# org.mortbay.jetty:jetty:6.1.26 -> >=dev-java/jetty-6.1.26:6
# org.mortbay.jetty:jetty-util:6.1.26 -> >=dev-java/jetty-util-6.1.26:6
# org.mortbay.jetty:servlet-api:2.5-20081211 -> >=dev-java/servlet-api-2.5.20081211:0
# org.slf4j:slf4j-api:1.7.7 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/avro-1.8.2:0
	>=dev-java/jackson-core-asl-1.9.13:0
	>=dev-java/jackson-mapper-asl-1.9.13:0
	>=dev-java/jetty-6.1.26:6
	>=dev-java/jetty-util-6.1.26:6
	dev-java/netty:3.10
	>=dev-java/servlet-api-2.5.20081211:0
	>=dev-java/slf4j-api-1.7.7:0
	>=dev-java/velocity-1.7:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.slf4j:slf4j-simple:1.7.7 -> >=dev-java/slf4j-simple-1.7.7:0
RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
	>=dev-java/slf4j-simple-1.7.7:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="netty-3.10,avro,velocity,jackson-core-asl,jackson-mapper-asl,jetty-6,jetty-util-6,servlet-api,slf4j-api,slf4j-simple"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
