# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/graal-sdk-19.2.1.pom --download-uri https://repo.maven.apache.org/maven2/org/graalvm/sdk/graal-sdk/19.2.1/graal-sdk-19.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild graal-sdk-19.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="GraalVM is an ecosystem for compiling and running applications written in multiple languages.
GraalVM removes the isolation between programming languages and enables interoperability in a shared runtime."
HOMEPAGE="https://github.com/oracle/graal"
SRC_URI="https://repo.maven.apache.org/maven2/org/graalvm/sdk/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.graalvm.sdk:graal-sdk:19.2.1"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
