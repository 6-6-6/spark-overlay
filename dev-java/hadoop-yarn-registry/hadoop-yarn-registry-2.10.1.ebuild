# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-yarn-registry-2.10.1.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-yarn-registry/2.10.1/hadoop-yarn-registry-2.10.1-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-yarn-registry/2.10.1/hadoop-yarn-registry-2.10.1.jar --slot 0 --keywords "~amd64" --ebuild hadoop-yarn-registry-2.10.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.hadoop:hadoop-yarn-registry:2.10.1"
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
# org.apache.curator:curator-framework:2.13.0 -> >=dev-java/curator-framework-2.13.0:0
# org.apache.hadoop:hadoop-common:2.10.1 -> >=dev-java/hadoop-common-2.10.1:0
# org.apache.hadoop:hadoop-yarn-api:2.10.1 -> >=dev-java/hadoop-yarn-api-2.10.1:0
# org.apache.hadoop:hadoop-yarn-common:2.10.1 -> >=dev-java/hadoop-yarn-common-2.10.1:0
# org.codehaus.jackson:jackson-core-asl:1.9.13 -> >=dev-java/jackson-core-asl-1.9.13:0
# org.codehaus.jackson:jackson-mapper-asl:1.9.13 -> >=dev-java/jackson-mapper-asl-1.9.13:0

CDEPEND="
	>=dev-java/curator-framework-2.13.0:0
	>=dev-java/hadoop-common-2.10.1:0
	>=dev-java/hadoop-yarn-api-2.10.1:0
	>=dev-java/hadoop-yarn-common-2.10.1:0
	>=dev-java/jackson-core-asl-1.9.13:0
	>=dev-java/jackson-mapper-asl-1.9.13:0
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

JAVA_GENTOO_CLASSPATH="curator-framework,hadoop-common,hadoop-yarn-api,hadoop-yarn-common,jackson-core-asl,jackson-mapper-asl"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
