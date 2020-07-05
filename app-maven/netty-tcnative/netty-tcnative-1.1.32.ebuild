# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-tcnative-1.1.32.Fork1.pom --download-uri https://repo.maven.apache.org/maven2/io/netty/netty-tcnative/1.1.32.Fork1/netty-tcnative-1.1.32.Fork1-sources.jar --slot 0 --keywords "~amd64" --ebuild netty-tcnative-1.1.32.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A Mavenized fork of Tomcat Native which incorporates various patches"
HOMEPAGE="https://github.com/netty/netty-tcnative/"
SRC_URI="https://repo.maven.apache.org/maven2/io/netty/${PN}/${PV}.Fork1/${P}.Fork1-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.netty:netty-tcnative:1.1.32.Fork1"



DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
