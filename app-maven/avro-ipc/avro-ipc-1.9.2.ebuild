# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/avro-ipc-1.9.2.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/avro/avro-ipc/1.9.2/avro-ipc-1.9.2-sources.jar --slot 0 --keywords "~amd64" --ebuild avro-ipc-1.9.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Avro inter-process communication components"
HOMEPAGE="https://avro.apache.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/avro/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.avro:avro-ipc:1.9.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-core:2.10.2 -> >=dev-java/jackson-2.11.0:2
# com.fasterxml.jackson.core:jackson-databind:2.10.2 -> >=dev-java/jackson-databind-2.11.0:2
# com.github.luben:zstd-jni:1.4.3-1 -> >=app-maven/zstd-jni-1.4.5.4:0
# javax.annotation:javax.annotation-api:1.3.2 -> >=dev-java/jsr250-1.3.2:0
# org.apache.avro:avro:1.9.2 -> >=app-maven/avro-1.9.2:0
# org.apache.velocity:velocity-engine-core:2.2 -> >=app-maven/velocity-engine-core-2.2:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-2.0.0_alpha1:0
# org.xerial.snappy:snappy-java:1.1.7.3 -> >=dev-java/snappy-1.1.7.5:1.1

CDEPEND="
	>=app-maven/avro-1.9.2:0
	>=app-maven/velocity-engine-core-2.2:0
	>=app-maven/zstd-jni-1.4.5.4:0
	>=dev-java/jackson-2.11.0:2
	>=dev-java/jackson-databind-2.11.0:2
	>=dev-java/jsr250-1.3.2:0
	>=dev-java/slf4j-api-2.0.0_alpha1:0
	>=dev-java/snappy-1.1.7.5:1.1
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.servlet:javax.servlet-api:4.0.1 -> >=java-virtuals/servlet-api-4.0:4.0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=java-virtuals/servlet-api-4.0:4.0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-2,jackson-databind-2,zstd-jni,jsr250,avro,velocity-engine-core,slf4j-api,snappy-1.1"
JAVA_CLASSPATH_EXTRA="servlet-api-4.0"
