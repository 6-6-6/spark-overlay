# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/avro-1.8.2.pom --download-uri https://repo1.maven.org/maven2/org/apache/avro/avro/1.8.2/avro-1.8.2-sources.jar --slot 0 --keywords "~amd64" --ebuild avro-1.8.2-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.avro:avro:1.8.2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Avro core components"
HOMEPAGE="http://avro.apache.org"
SRC_URI="https://repo1.maven.org/maven2/org/apache/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.thoughtworks.paranamer:paranamer:2.7 -> >=dev-java/paranamer-2.8:0
# joda-time:joda-time:2.7 -> >=dev-java/joda-time-2.7:0
# org.apache.commons:commons-compress:1.8.1 -> >=dev-java/commons-compress-1.10:0
# org.codehaus.jackson:jackson-core-asl:1.9.13 -> >=dev-java/jackson-core-asl-1.9.13:0
# org.codehaus.jackson:jackson-mapper-asl:1.9.13 -> >=dev-java/jackson-mapper-asl-1.9.13:0
# org.slf4j:slf4j-api:1.7.7 -> >=dev-java/slf4j-api-1.7.7:0
# org.tukaani:xz:1.5 -> >=dev-java/xz-java-1.8:0
# org.xerial.snappy:snappy-java:1.1.1.3 -> >=dev-java/snappy-1.1.7.5:1.1

CDEPEND="
	>=dev-java/jackson-core-asl-1.9.13:0
	>=dev-java/jackson-mapper-asl-1.9.13:0
	>=dev-java/paranamer-2.8:0
	>=dev-java/commons-compress-1.10:0
	>=dev-java/joda-time-2.7:0
	>=dev-java/slf4j-api-1.7.7:0
	>=dev-java/snappy-1.1.7.5:1.1
	>=dev-java/xz-java-1.8:0
	dev-java/guava:0
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

JAVA_GENTOO_CLASSPATH="paranamer,joda-time,commons-compress,jackson-core-asl,jackson-mapper-asl,slf4j-api,xz-java,snappy-1.1,slf4j-simple,guava"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
