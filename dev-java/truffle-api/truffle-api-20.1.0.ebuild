# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/truffle-api-20.1.0.pom --download-uri https://repo.maven.apache.org/maven2/org/graalvm/truffle/truffle-api/20.1.0/truffle-api-20.1.0-sources.jar --slot 0 --keywords "~amd64" --ebuild truffle-api-20.1.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Truffle is a multi-language framework for executing dynamic languages
that achieves high performance when combined with Graal."
HOMEPAGE="http://openjdk.java.net/projects/graal"
SRC_URI="https://repo.maven.apache.org/maven2/org/graalvm/truffle/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.graalvm.truffle:truffle-api:20.1.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.graalvm.sdk:graal-sdk:20.1.0 -> !!!groupId-not-found!!!

CDEPEND="
	>=app-maven/graal-sdk-20.1.0:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"


JAVA_GENTOO_CLASSPATH="graal-sdk"

S="${WORKDIR}"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	rm ${S}/${JAVA_SRC_DIR}/META-INF -r
}
