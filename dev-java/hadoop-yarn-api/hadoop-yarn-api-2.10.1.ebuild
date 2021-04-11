# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-yarn-api-2.10.1.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-yarn-api/2.10.1/hadoop-yarn-api-2.10.1-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-yarn-api/2.10.1/hadoop-yarn-api-2.10.1.jar --slot 0 --keywords "~amd64" --ebuild hadoop-yarn-api-2.10.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.hadoop:hadoop-yarn-api:2.10.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Apache Hadoop Project POM"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava:11.0.2 -> >=dev-java/guava-20.0:20
# com.google.protobuf:protobuf-java:2.5.0 -> >=dev-java/protobuf-java-2.5.0:0
# commons-lang:commons-lang:2.6 -> >=dev-java/commons-lang-2.6:2.1
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# javax.xml.bind:jaxb-api:2.2.2 -> >=dev-java/jaxb-api-2.2.2:0
# org.apache.hadoop:hadoop-annotations:2.10.1 -> >=dev-java/hadoop-annotations-2.10.1:0

CDEPEND="
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/commons-logging-1.2:0
	>=dev-java/guava-20.0:20
	>=dev-java/hadoop-annotations-2.10.1:0
	>=dev-java/jaxb-api-2.2.2:0
	>=dev-java/protobuf-java-2.5.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-common:2.10.1 -> >=dev-java/hadoop-common-2.10.1:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/hadoop-common-2.10.1:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guava-20,protobuf-java,commons-lang-2.1,commons-logging,jaxb-api,hadoop-annotations"
JAVA_CLASSPATH_EXTRA="hadoop-common"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
