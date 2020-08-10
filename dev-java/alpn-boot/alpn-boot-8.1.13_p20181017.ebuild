# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/alpn-boot-8.1.13.v20181017.pom --download-uri https://repo1.maven.org/maven2/org/mortbay/jetty/alpn/alpn-boot/8.1.13.v20181017/alpn-boot-8.1.13.v20181017-sources.jar --slot 0 --keywords "~amd64" --ebuild alpn-boot-8.1.2_p20141202-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.mortbay.jetty.alpn:alpn-boot:8.1.13.v20181017"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="A pure Java(TM) implementation of the Application Layer Protocol Negotiation TLS Extension"
HOMEPAGE="http://www.eclipse.org/jetty/alpn-project/alpn-boot"
SRC_URI="https://repo1.maven.org/maven2/org/mortbay/jetty/alpn/${PN}/8.1.13.v20181017/${PN}-8.1.13.v20181017-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/mortbay/jetty/alpn/${PN}/8.1.13.v20181017/${PN}-8.1.13.v20181017.jar -> ${P}-bin.jar"
LICENSE="GPL-2-with-classpath-exception Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	test? (
		amd64? (
			dev-util/japi-compliance-checker
			dev-util/pkgdiff
		)
	)"

RDEPEND="
	>=virtual/jre-1.8:*
	dev-java/jetty-alpn-api:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jetty-alpn-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_TESTING_FRAMEWORKS="pkgdiff"
