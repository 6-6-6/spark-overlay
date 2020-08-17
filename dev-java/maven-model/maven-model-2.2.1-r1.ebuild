# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/maven-model-2.2.1.pom --download-uri https://repo1.maven.org/maven2/org/apache/maven/maven-model/2.2.1/maven-model-2.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild maven-model-2.2.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.maven:maven-model:2.2.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Maven Model"
HOMEPAGE="http://maven.apache.org/maven-model"
SRC_URI="https://repo1.maven.org/maven2/org/apache/maven/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/maven/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.plexus:plexus-utils:1.5.15 -> >=dev-java/plexus-utils-1.5.15:0

CDEPEND="
	>=dev-java/plexus-utils-1.5.15:0
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

JAVA_GENTOO_CLASSPATH="plexus-utils"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
