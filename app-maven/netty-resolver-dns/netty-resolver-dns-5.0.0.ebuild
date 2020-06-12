# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-resolver-dns-5.0.0.Alpha2.pom --download-uri https://repo.maven.apache.org/maven2/io/netty/netty-resolver-dns/5.0.0.Alpha2/netty-resolver-dns-5.0.0.Alpha2-sources.jar --slot 0 --keywords "~amd64" --ebuild netty-resolver-dns-5.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Netty is an asynchronous event-driven network application framework for
    rapid development of maintainable high performance protocol servers and
    clients."
HOMEPAGE="http://netty.io/netty-resolver-dns/"
SRC_URI="https://repo.maven.apache.org/maven2/io/netty/${PN}/${PV}.Alpha2/${P}.Alpha2-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.netty:netty-resolver-dns:5.0.0.Alpha2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha2.pom
# io.netty:netty-codec-dns:5.0.0.Alpha2 -> >=app-maven/netty-codec-dns-5.0.0:0
# io.netty:netty-resolver:5.0.0.Alpha2 -> >=app-maven/netty-resolver-5.0.0:0
# io.netty:netty-transport:5.0.0.Alpha2 -> >=dev-java/netty-buffer-4.0.21:0

CDEPEND="
	>=app-maven/netty-codec-dns-5.0.0:0
	>=app-maven/netty-resolver-5.0.0:0
	>=dev-java/netty-buffer-4.0.21:0
"


DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="netty-codec-dns,netty-resolver,netty-buffer"
