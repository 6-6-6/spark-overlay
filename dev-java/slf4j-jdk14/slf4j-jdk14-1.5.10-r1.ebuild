# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/slf4j-jdk14-1.5.10.pom --download-uri https://repo1.maven.org/maven2/org/slf4j/slf4j-jdk14/1.5.10/slf4j-jdk14-1.5.10-sources.jar --slot 0 --keywords "~amd64" --ebuild slf4j-jdk14-1.5.10-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.slf4j:slf4j-jdk14:1.5.10"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The slf4j JDK14 binding"
HOMEPAGE="http://www.slf4j.org"
SRC_URI="https://repo1.maven.org/maven2/org/slf4j/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/slf4j/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.slf4j:slf4j-api:1.5.10 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/slf4j-api-1.7.7:0
"

DEPEND="
	>=virtual/jdk-1.3:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.3:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="slf4j-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"