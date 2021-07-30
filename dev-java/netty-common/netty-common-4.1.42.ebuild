# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-common-4.1.42.Final.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/io/netty/netty-common/4.1.42.Final/netty-common-4.1.42.Final-sources.jar --binjar-uri https://repo1.maven.org/maven2/io/netty/netty-common/4.1.42.Final/netty-common-4.1.42.Final.jar --slot 0 --keywords "~amd64" --ebuild netty-common-4.1.42.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="io.netty:netty-common:4.1.42.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Asynchronous event-driven network application framework"
HOMEPAGE="https://netty.io/netty-common/"
SRC_URI="
	https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# commons-logging:commons-logging:1.2 -> >=dev-java/commons-logging-1.2:0
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.apache.logging.log4j:log4j-api:2.6.2 -> >=dev-java/log4j-api-2.7:0
# org.slf4j:slf4j-api:1.7.21 -> >=dev-java/slf4j-api-1.7.28:0

# Additional dependencies
# org.jctools.queues -> dev-java/jctools-core:2.1

CDEPEND="
	>=dev-java/commons-logging-1.2:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/log4j-api-2.7:0
	>=dev-java/slf4j-api-1.7.28:0
	dev-java/jctools-core:2.1
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# com.oracle.substratevm:svm:19.0.0 -> >=dev-java/svm-19.2.1:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/svm-19.2.1:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="commons-logging,log4j,log4j-api,slf4j-api,jctools-core-2.1"
JAVA_CLASSPATH_EXTRA="svm"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
