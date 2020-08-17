# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-resolver-4.1.42.Final.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/io/netty/netty-resolver/4.1.42.Final/netty-resolver-4.1.42.Final-sources.jar --binjar-uri https://repo1.maven.org/maven2/io/netty/netty-resolver/4.1.42.Final/netty-resolver-4.1.42.Final.jar --slot 0 --keywords "~amd64" --ebuild netty-resolver-4.1.42.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="io.netty:netty-resolver:4.1.42.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Netty is an asynchronous event-driven network application framework for rapid development of maintainable high performance protocol servers and clients."
HOMEPAGE="https://netty.io/netty-resolver/"
SRC_URI="https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# io.netty:netty-common:4.1.42.Final -> >=dev-java/netty-common-4.1.42:0

CDEPEND="
	>=dev-java/netty-common-4.1.42:0
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

JAVA_GENTOO_CLASSPATH="netty-common"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
