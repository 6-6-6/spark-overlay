# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-yarn-api-3.2.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/hadoop/hadoop-yarn-api/3.2.1/hadoop-yarn-api-3.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-yarn-api-3.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Hadoop Project POM"
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-yarn-api:3.2.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-annotations:2.9.8 -> >=dev-java/jackson-annotations-2.9.10:2
# com.google.guava:guava:27.0-jre -> >=dev-java/guava-20.0:20
# com.google.protobuf:protobuf-java:2.5.0 -> >=app-maven/protobuf-java-3.12.2:0
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# javax.xml.bind:jaxb-api:2.2.11 -> >=app-maven/jaxb-api-2.4.0.180830.0359:0
# org.apache.hadoop:hadoop-annotations:3.2.1 -> >=app-maven/hadoop-annotations-3.2.1:0

CDEPEND="
	>=app-maven/hadoop-annotations-3.2.1:0
	>=app-maven/jaxb-api-2.4.0.180830.0359:0
	>=app-maven/protobuf-java-3.12.2:0
	>=dev-java/commons-logging-1.2:0
	>=dev-java/guava-20.0:20
	>=dev-java/jackson-annotations-2.9.10:2
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-common:3.2.1 -> >=app-maven/hadoop-common-3.2.1:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/hadoop-common-3.2.1:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-annotations-2,guava-20,protobuf-java,commons-logging,jaxb-api,hadoop-annotations"
JAVA_GENTOO_CLASSPATH_EXTRA="hadoop-common"
