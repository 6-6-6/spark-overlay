# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-common-5.0.0.Alpha2.pom --download-uri https://repo1.maven.org/maven2/io/netty/netty-common/5.0.0.Alpha2/netty-common-5.0.0.Alpha2-sources.jar --slot 0 --keywords "~amd64" --ebuild netty-common-5.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Netty is an asynchronous event-driven network application framework for
rapid development of maintainable high performance protocol servers and clients."
HOMEPAGE="http://netty.io/netty-common/"
SRC_URI="https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Alpha2/${P}.Alpha2-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Alpha2/${P}.Alpha2.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64"
MAVEN_ID="io.netty:netty-common:5.0.0.Alpha2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha2.pom
# commons-logging:commons-logging:1.1.3 -> >=dev-java/commons-logging-1.2:0
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.javassist:javassist:3.19.0-GA -> >=dev-java/javassist-3.21.0:3
# org.slf4j:slf4j-api:1.7.5 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/commons-logging-1.2:0
	>=dev-java/javassist-3.21.0:3
	>=dev-java/log4j-1.2.17:0
	>=dev-java/slf4j-api-1.7.7:0
"


DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="commons-logging,log4j,javassist-3,slf4j-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
