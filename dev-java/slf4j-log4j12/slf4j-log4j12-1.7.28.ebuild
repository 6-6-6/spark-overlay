# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/slf4j-log4j12-1.7.25.pom --download-uri https://repo.maven.apache.org/maven2/org/slf4j/slf4j-log4j12/1.7.25/slf4j-log4j12-1.7.25-sources.jar --slot 0 --keywords "~amd64" --ebuild slf4j-log4j12-1.7.25.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.slf4j:slf4j-log4j12:1.7.28"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="SLF4J LOG4J-12 Binding"
HOMEPAGE="http://www.slf4j.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/slf4j/${PN}/${PV}/${P}-sources.jar"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
#"x86"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-1.7.28:0

CDEPEND="
	>=dev-java/log4j-1.2.17:0
	>=dev-java/slf4j-api-1.7.28:0
"

DEPEND="
	>=virtual/jdk-1.5:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="log4j,slf4j-api"
JAVA_SRC_DIR="src/main/java"
