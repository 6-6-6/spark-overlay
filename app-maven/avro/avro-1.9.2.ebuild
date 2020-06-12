# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/avro-1.9.2.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/avro/avro/1.9.2/avro-1.9.2-sources.jar --slot 0 --keywords "~amd64" --ebuild avro-1.9.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Avro core components"
HOMEPAGE="https://avro.apache.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.avro:avro:1.9.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-core:2.10.2 -> >=dev-java/jackson-2.9.10:2
# com.fasterxml.jackson.core:jackson-databind:2.10.2 -> >=dev-java/jackson-databind-2.11.0:0
# com.github.luben:zstd-jni:1.4.3-1 -> >=app-maven/zstd-jni-1.4.5.4:0
# joda-time:joda-time:2.10.1 -> >=dev-java/joda-time-2.7:0
# org.apache.commons:commons-compress:1.19 -> >=dev-java/commons-compress-1.20:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-1.7.7:0
# org.xerial.snappy:snappy-java:1.1.7.3 -> >=dev-java/snappy-1.0.3_rc3:1.0

CDEPEND="
	>=app-maven/zstd-jni-1.4.5.4:0
	>=dev-java/commons-compress-1.20:0
	>=dev-java/jackson-2.9.10:2
	>=dev-java/jackson-databind-2.11.0:0
	>=dev-java/joda-time-2.7:0
	>=dev-java/slf4j-api-1.7.7:0
	>=dev-java/snappy-1.0.3_rc3:1.0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.tukaani:xz:1.8 -> >=dev-java/xz-java-1.8:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=dev-java/xz-java-1.8:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-2,jackson-databind,zstd-jni,joda-time,commons-compress,slf4j-api,snappy-1.0"
JAVA_GENTOO_CLASSPATH_EXTRA="xz-java"
