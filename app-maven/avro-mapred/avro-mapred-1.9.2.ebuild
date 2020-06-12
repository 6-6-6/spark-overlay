# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/avro-mapred-1.9.2.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/avro/avro-mapred/1.9.2/avro-mapred-1.9.2-sources.jar --slot 0 --keywords "~amd64" --ebuild avro-mapred-1.9.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="An org.apache.hadoop.mapred compatible API for using Avro Serialization in Hadoop"
HOMEPAGE="https://avro.apache.org/avro-mapred"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/avro/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.avro:avro-mapred:1.9.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-core:2.10.2 -> >=dev-java/jackson-2.9.10:2
# org.apache.avro:avro-ipc:1.9.2 -> >=app-maven/avro-ipc-1.9.2:0
# org.apache.avro:avro-ipc-jetty:1.9.2 -> >=app-maven/avro-ipc-jetty-1.9.2:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=app-maven/avro-ipc-1.9.2:0
	>=app-maven/avro-ipc-jetty-1.9.2:0
	>=dev-java/jackson-2.9.10:2
	>=dev-java/slf4j-api-1.7.7:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-client:2.7.7 -> >=app-maven/hadoop-client-3.2.1:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/hadoop-client-3.2.1:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-2,avro-ipc,avro-ipc-jetty,slf4j-api"
JAVA_GENTOO_CLASSPATH_EXTRA="hadoop-client"
