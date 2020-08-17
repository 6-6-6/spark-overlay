# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/disruptor-1.2.8-JDK7.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/conversantmedia/disruptor/1.2.8-JDK7/disruptor-1.2.8-JDK7-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/conversantmedia/disruptor/1.2.8-JDK7/disruptor-1.2.8-JDK7.jar --slot 0 --keywords "~amd64" --ebuild disruptor-1.2.8.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.conversantmedia:disruptor:1.2.8-JDK7"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN="disruptor"
MY_P=${MY_PN}-${PV}
DESCRIPTION="Conversant Disruptor - very low latency Java BlockingQueue"
HOMEPAGE="https://github.com/conversant/disruptor"
SRC_URI="https://repo1.maven.org/maven2/com/conversantmedia/${MY_PN}/${PV}-JDK7/${MY_P}-JDK7-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/conversantmedia/${MY_PN}/${PV}-JDK7/${MY_P}-JDK7.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-JDK7.pom
# org.slf4j:slf4j-api:1.7.13 -> >=dev-java/slf4j-api-1.7.28:0

CDEPEND="
	>=dev-java/slf4j-api-1.7.28:0
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

JAVA_GENTOO_CLASSPATH="slf4j-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
