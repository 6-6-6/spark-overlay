# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/npn-boot-1.1.9.v20141016.pom --download-uri https://repo1.maven.org/maven2/org/mortbay/jetty/npn/npn-boot/1.1.9.v20141016/npn-boot-1.1.9.v20141016-sources.jar --slot 0 --keywords "~amd64" --ebuild npn-boot-1.1.9_p20141016-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.mortbay.jetty.npn:npn-boot:1.1.9.v20141016"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="A pure Java(TM) implementation of the Next Protocol Negotiation TLS Extension"
HOMEPAGE="http://www.eclipse.org/jetty/npn-project/npn-boot"
SRC_URI="https://repo1.maven.org/maven2/org/mortbay/jetty/npn/${PN}/1.1.9.v20141016/${PN}-1.1.9.v20141016-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/mortbay/jetty/npn/${PN}/1.1.9.v20141016/${PN}-1.1.9.v20141016.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0 GPL-2-with-classpath-exception"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
	test? (
		amd64? (
			dev-util/japi-compliance-checker
			dev-util/pkgdiff
		)
	)"

RDEPEND="
	>=virtual/jre-1.7:*
	dev-java/jetty-npn-api:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jetty-npn-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_TESTING_FRAMEWORKS="pkgdiff"
