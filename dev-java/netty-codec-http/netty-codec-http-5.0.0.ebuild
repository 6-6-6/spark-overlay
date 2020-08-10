# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-codec-http-5.0.0.Alpha2.pom --download-uri https://repo1.maven.org/maven2/io/netty/netty-codec-http/5.0.0.Alpha2/netty-codec-http-5.0.0.Alpha2-sources.jar --slot 0 --keywords "~amd64" --ebuild netty-codec-http-5.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary test"
MAVEN_ID="io.netty:netty-codec-http:5.0.0.Alpha2"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Netty is an asynchronous event-driven network application framework for rapid development of maintainable high performance protocol servers and clients."
HOMEPAGE="http://netty.io/netty-codec-http/"
SRC_URI="https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Alpha2/${P}.Alpha2-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Alpha2/${P}.Alpha2.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha2.pom
# com.jcraft:jzlib:1.1.2 -> >=dev-java/jzlib-1.1.3:1.1.3
# io.netty:netty-codec:5.0.0.Alpha2 -> >=dev-java/netty-codec-5.0.0:0
# io.netty:netty-handler:5.0.0.Alpha2 -> >=dev-java/netty-handler-5.0.0:0

CDEPEND="
	>=dev-java/jzlib-1.1.3:1.1.3
	>=dev-java/netty-codec-5.0.0:0
	>=dev-java/netty-handler-5.0.0:0
"

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
	test? (
		amd64? (
			dev-util/japi-compliance-checker
			dev-util/pkgdiff
		)
	)"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jzlib-1.1.3,netty-codec,netty-handler"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_TESTING_FRAMEWORKS="pkgdiff"
