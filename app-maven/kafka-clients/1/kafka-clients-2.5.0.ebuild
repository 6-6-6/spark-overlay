# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/kafka-clients-2.5.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/kafka/kafka-clients/2.5.0/kafka-clients-2.5.0-sources.jar --slot 0 --keywords "~amd64" --ebuild kafka-clients-2.5.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION=""
HOMEPAGE="https://kafka.apache.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/kafka/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.kafka:kafka-clients:2.5.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.luben:zstd-jni:1.4.4-7 -> >=app-maven/zstd-jni-1.4.5.4:0
# org.lz4:lz4-java:1.7.1 -> >=app-maven/lz4-java-1.7.1:0
# org.slf4j:slf4j-api:1.7.30 -> >=dev-java/slf4j-api-2.0.0_alpha1:0
# org.xerial.snappy:snappy-java:1.1.7.3 -> >=dev-java/snappy-1.1.7.5:1.1

CDEPEND="
	>=app-maven/lz4-java-1.7.1:0
	>=app-maven/zstd-jni-1.4.5.4:0
	>=dev-java/slf4j-api-2.0.0_alpha1:0
	>=dev-java/snappy-1.1.7.5:1.1
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-databind:2.10.2 -> >=dev-java/jackson-databind-2.11.0:2

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=dev-java/jackson-databind-2.11.0:2
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="zstd-jni,lz4-java,slf4j-api,snappy-1.1"
JAVA_CLASSPATH_EXTRA="jackson-databind-2"
