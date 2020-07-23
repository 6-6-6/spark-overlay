# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/spark-network-common_2.12-3.0.0-preview2.pom --download-uri https://repo1.maven.org/maven2/org/apache/spark/spark-network-common_2.12/3.0.0-preview2/spark-network-common_2.12-3.0.0-preview2-sources.jar --slot 2.12 --keywords "~amd64" --ebuild spark-network-common-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Apache Software Foundation provides support for the Apache community of open-source software projects.
    The Apache projects are characterized by a collaborative, consensus based development process, an open and
    pragmatic software license, and a desire to create high quality software that leads the way in its field.
    We consider ourselves not simply a group of projects sharing a server, but rather a community of developers
    and users."
HOMEPAGE="http://spark.apache.org/"
SRC_URI="https://repo1.maven.org/maven2/org/apache/spark/${PN}_2.12/${PV}-preview2/${PN}_2.12-${PV}-preview2-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/org/apache/spark/${PN}_2.12/${PV}-preview2/${PN}_2.12-${PV}-preview2.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="2.12"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.spark:spark-network-common_2.12:3.0.0-preview2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}-preview2.pom
# com.fasterxml.jackson.core:jackson-annotations:2.10.0 -> >=dev-java/jackson-annotations-2.11.0:2
# com.fasterxml.jackson.core:jackson-databind:2.10.0 -> >=app-maven/jackson-databind-2.10.0:0
# com.google.code.findbugs:jsr305:3.0.0 -> >=dev-java/jsr305-3.0.1:0
# io.dropwizard.metrics:metrics-core:4.1.1 -> >=app-maven/metrics-core-4.1.1:0
# io.netty:netty-all:4.1.42.Final -> >=dev-java/netty-all-5.0.0:0
# org.apache.commons:commons-crypto:1.0.0 -> >=dev-java/commons-crypto-1.0.0:0
# org.apache.commons:commons-lang3:3.9 -> >=dev-java/commons-lang-3.10:3.10
# org.fusesource.leveldbjni:leveldbjni:1.8 -> >=dev-java/leveldbjni-1.8:0
# org.scala-lang:scala-library:2.12.10 -> >=dev-java/scala-common-bin-2.12.4:2.12
# org.spark-project.spark:unused:1.0.0 -> >=app-maven/unused-1.0.0:0

CDEPEND="
	>=app-maven/jackson-databind-2.10.0:0
	>=app-maven/metrics-core-4.1.1:0
	>=app-maven/unused-1.0.0:0
	>=dev-java/commons-crypto-1.0.0:0
	>=dev-java/commons-lang-3.10:3.10
	>=dev-java/jackson-annotations-2.11.0:2
	>=dev-java/jsr305-3.0.1:0
	>=dev-java/leveldbjni-1.8:0
	>=dev-java/netty-all-5.0.0:0
	>=dev-java/scala-common-bin-2.12.4:2.12
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}-preview2.pom
# org.slf4j:slf4j-api:1.7.16 -> >=dev-java/slf4j-api-1.7.28:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/slf4j-api-1.7.28:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-annotations-2,jackson-databind,jsr305,metrics-core,netty-all,commons-crypto,commons-lang-3.10,leveldbjni,scala-common-bin-2.12,unused"
JAVA_CLASSPATH_EXTRA="slf4j-api"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
