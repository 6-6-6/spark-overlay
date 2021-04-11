# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jmespath-java-1.11.166.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/amazonaws/jmespath-java/1.11.166/jmespath-java-1.11.166-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/amazonaws/jmespath-java/1.11.166/jmespath-java-1.11.166.jar --slot 0 --keywords "~amd64" --ebuild jmespath-java-1.11.166.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.amazonaws:jmespath-java:1.11.166"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Implementation of the JMES Path JSON Query langauge for Java."
HOMEPAGE="https://aws.amazon.com/sdkforjava"
SRC_URI="https://repo1.maven.org/maven2/com/amazonaws/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/amazonaws/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-databind:2.6.7.1 -> >=dev-java/jackson-databind-2.10.0:0

CDEPEND="
	>=dev-java/jackson-databind-2.10.0:0
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

JAVA_GENTOO_CLASSPATH="jackson-databind"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
