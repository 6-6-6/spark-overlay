# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/avro-1.10.1.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/apache/avro/avro/1.10.1/avro-1.10.1-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/apache/avro/avro/1.10.1/avro-1.10.1.jar --slot 0 --keywords "~amd64" --ebuild avro-1.10.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.avro:avro:1.10.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Avro core components"
HOMEPAGE="https://avro.apache.org"
SRC_URI="https://repo1.maven.org/maven2/org/apache/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-core:2.11.3 -> >=dev-java/jackson-core-2.11.3:0
# com.fasterxml.jackson.core:jackson-databind:2.11.3 -> >=dev-java/jackson-databind-2.11.3:0
# com.github.luben:zstd-jni:1.4.5-12 -> >=dev-java/zstd-jni-1.4.9.1:0
# org.apache.commons:commons-compress:1.20 -> >=dev-java/commons-compress-1.20:0
# org.slf4j:slf4j-api:1.7.30 -> >=dev-java/slf4j-api-1.7.30:0
# org.tukaani:xz:1.8 -> >=dev-java/xz-java-1.8:0
# org.xerial.snappy:snappy-java:1.1.8.1 -> >=dev-java/snappy-java-1.1.8.1:0

CDEPEND="
	>=dev-java/commons-compress-1.20:0
	>=dev-java/jackson-core-2.11.3:0
	>=dev-java/jackson-databind-2.11.3:0
	>=dev-java/slf4j-api-1.7.30:0
	>=dev-java/snappy-java-1.1.8.1:0
	>=dev-java/xz-java-1.8:0
	>=dev-java/zstd-jni-1.4.9.1:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-core,jackson-databind,zstd-jni,commons-compress,slf4j-api,xz-java,snappy-java"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
