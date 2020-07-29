# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-module-scala_2.12-2.10.0.pom --download-uri https://repo1.maven.org/maven2/com/fasterxml/jackson/module/jackson-module-scala_2.12/2.10.0/jackson-module-scala_2.12-2.10.0-sources.jar --slot 2.12 --keywords "~amd64" --ebuild jackson-module-scala-2.10.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="jackson-module-scala"
HOMEPAGE="http://wiki.fasterxml.com/JacksonModuleScala"
SRC_URI="https://repo1.maven.org/maven2/com/fasterxml/jackson/module/${PN}_2.12/${PV}/${PN}_2.12-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/fasterxml/jackson/module/${PN}_2.12/${PV}/${PN}_2.12-${PV}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="2.12"
KEYWORDS="~amd64"
MAVEN_ID="com.fasterxml.jackson.module:jackson-module-scala_2.12:2.10.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}.pom
# com.fasterxml.jackson.core:jackson-annotations:2.10.0 -> >=dev-java/jackson-annotations-2.11.0:2
# com.fasterxml.jackson.core:jackson-core:2.10.0 -> >=dev-java/jackson-2.11.0:2
# com.fasterxml.jackson.core:jackson-databind:2.10.0 -> >=dev-java/jackson-databind-2.10.0:0
# com.fasterxml.jackson.module:jackson-module-paranamer:2.10.0 -> >=dev-java/jackson-module-paranamer-2.10.0:0
# org.scala-lang:scala-library:2.12.10 -> >=dev-java/scala-common-bin-2.12.4:2.12

CDEPEND="
	>=dev-java/jackson-databind-2.10.0:0
	>=dev-java/jackson-module-paranamer-2.10.0:0
	>=dev-java/jackson-2.11.0:2
	>=dev-java/jackson-annotations-2.11.0:2
	>=dev-java/scala-common-bin-2.12.4:2.12
"


DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-annotations-2,jackson-2,jackson-databind,jackson-module-paranamer,scala-common-bin-2.12"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

