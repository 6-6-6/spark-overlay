# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-databind-2.10.0.pom --download-uri https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-databind/2.10.0/jackson-databind-2.10.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jackson-databind-2.10.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.fasterxml.jackson.core:jackson-databind:2.10.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="General data-binding functionality for Jackson: works on core streaming API"
HOMEPAGE="http://github.com/FasterXML/jackson"
SRC_URI="https://repo1.maven.org/maven2/com/fasterxml/jackson/core/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/fasterxml/jackson/core/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-annotations:2.10.0 -> >=dev-java/jackson-annotations-2.11.0:2
# com.fasterxml.jackson.core:jackson-core:2.10.0 -> >=dev-java/jackson-2.11.0:2

CDEPEND="
	>=dev-java/jackson-2.11.0:2
	>=dev-java/jackson-annotations-2.11.0:2
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

JAVA_GENTOO_CLASSPATH="jackson-annotations-2,jackson-2"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
