# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-xc-1.8.3.pom --download-uri https://repo1.maven.org/maven2/org/codehaus/jackson/jackson-xc/1.8.3/jackson-xc-1.8.3-sources.jar --slot 0 --keywords "~amd64" --ebuild jackson-xc-1.8.3-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.codehaus.jackson:jackson-xc:1.8.3"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Extensions that provide interoperability support for Jackson JSON processor's data binding functionality."
HOMEPAGE="http://jackson.codehaus.org"
SRC_URI="https://repo1.maven.org/maven2/org/codehaus/jackson/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/codehaus/jackson/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.jackson:jackson-core-asl:1.8.3 -> >=dev-java/jackson-core-asl-1.9.13:0
# org.codehaus.jackson:jackson-mapper-asl:1.8.3 -> >=dev-java/jackson-mapper-asl-1.9.13:0

CDEPEND="
	>=dev-java/jackson-core-asl-1.9.13:0
	>=dev-java/jackson-mapper-asl-1.9.13:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-core-asl,jackson-mapper-asl"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
