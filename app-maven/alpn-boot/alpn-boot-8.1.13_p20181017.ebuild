# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/alpn-boot-8.1.13.v20181017.pom --download-uri https://repo.maven.apache.org/maven2/org/mortbay/jetty/alpn/alpn-boot/8.1.13.v20181017/alpn-boot-8.1.13.v20181017-sources.jar --slot 0 --keywords "~amd64" --ebuild alpn-boot-8.1.13_p20181017.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A pure Java(TM) implementation of the Application Layer Protocol Negotiation TLS Extension"
HOMEPAGE="http://www.eclipse.org/jetty/alpn-project/alpn-boot"
SRC_URI="https://repo.maven.apache.org/maven2/org/mortbay/jetty/alpn/${PN}/8.1.13.v20181017/${PN}-8.1.13.v20181017-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.mortbay.jetty.alpn:alpn-boot:8.1.13.v20181017"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

