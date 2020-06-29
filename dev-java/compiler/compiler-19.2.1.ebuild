# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/compiler-19.2.1.pom --download-uri https://repo.maven.apache.org/maven2/org/graalvm/compiler/compiler/19.2.1/compiler-19.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild compiler-19.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The GraalVM compiler and the Graal-truffle optimizer."
HOMEPAGE="http://www.graalvm.org/"
SRC_URI="https://repo.maven.apache.org/maven2/org/graalvm/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.graalvm.compiler:compiler:19.2.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.graalvm.sdk:graal-sdk:19.2.1 -> >=app-maven/graal-sdk-19.2.1:0
# org.graalvm.truffle:truffle-api:19.2.1 -> >=dev-java/truffle-api-20.1.0:0

CDEPEND="
	>=app-maven/graal-sdk-19.2.1:0
	>=dev-java/truffle-api-20.1.0:0
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

JAVA_GENTOO_CLASSPATH="graal-sdk,truffle-api"
