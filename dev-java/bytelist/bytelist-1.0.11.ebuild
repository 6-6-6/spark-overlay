# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/bytelist-1.0.11.pom --download-uri https://repo.maven.apache.org/maven2/org/jruby/extras/bytelist/1.0.11/bytelist-1.0.11-sources.jar --slot 0 --keywords "~amd64" --ebuild bytelist-1.0.11.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Byte array based container"
HOMEPAGE="https://github.com/jruby/bytelist"
SRC_URI="https://repo.maven.apache.org/maven2/org/jruby/extras/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jruby.extras:bytelist:1.0.11"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.jruby.jcodings:jcodings:1.0.5 -> >=dev-java/jcodings-1.0.5:0

CDEPEND="
	>=dev-java/jcodings-1.0.5:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jcodings"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
