# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/avro-mapred-1.8.2.pom --download-uri https://repo1.maven.org/maven2/org/apache/avro/avro-mapred/1.8.2/avro-mapred-1.8.2-sources.jar --slot 0 --keywords "~amd64" --ebuild avro-mapred-1.8.2-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.avro:avro-mapred:1.8.2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="An org.apache.hadoop.mapred compatible API for using Avro Serializatin in Hadoop"
HOMEPAGE="http://avro.apache.org/avro-mapred"
SRC_URI="https://repo1.maven.org/maven2/org/apache/avro/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/avro/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# commons-codec:commons-codec:1.9 -> >=dev-java/commons-codec-1.11:0
# org.apache.avro:avro-ipc:1.8.2 -> >=dev-java/avro-ipc-1.8.2:0
# org.codehaus.jackson:jackson-core-asl:1.9.13 -> >=dev-java/jackson-core-asl-1.9.13:0
# org.codehaus.jackson:jackson-mapper-asl:1.9.13 -> >=dev-java/jackson-mapper-asl-1.9.13:0
# org.slf4j:slf4j-api:1.7.7 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/avro-ipc-1.8.2:0
	>=dev-java/jackson-core-asl-1.9.13:0
	>=dev-java/jackson-mapper-asl-1.9.13:0
	>=dev-java/commons-codec-1.11:0
	>=dev-java/slf4j-api-1.7.7:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-client:2.5.1 -> >=dev-java/hadoop-client-2.7.4:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/hadoop-client-2.7.4:0
	)
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

JAVA_GENTOO_CLASSPATH="commons-codec,avro-ipc,jackson-core-asl,jackson-mapper-asl,slf4j-api,slf4j-simple"
JAVA_CLASSPATH_EXTRA="hadoop-client"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
