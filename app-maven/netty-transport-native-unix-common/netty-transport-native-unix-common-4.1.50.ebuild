# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-transport-native-unix-common-4.1.50.Final.pom --download-uri https://repo.maven.apache.org/maven2/io/netty/netty-transport-native-unix-common/4.1.50.Final/netty-transport-native-unix-common-4.1.50.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild netty-transport-native-unix-common-4.1.50.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Static library which contains common unix utilities."
HOMEPAGE="https://netty.io/netty-transport-native-unix-common/"
SRC_URI="https://repo.maven.apache.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.netty:netty-transport-native-unix-common:4.1.50.Final"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# io.netty:netty-buffer:4.1.50.Final -> >=dev-java/netty-buffer-4.0.21:0
# io.netty:netty-common:4.1.50.Final -> >=dev-java/netty-buffer-4.0.21:0
# io.netty:netty-transport:4.1.50.Final -> >=dev-java/netty-buffer-4.0.21:0

CDEPEND="
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

JAVA_GENTOO_CLASSPATH="netty-buffer,netty-buffer,netty-buffer"
