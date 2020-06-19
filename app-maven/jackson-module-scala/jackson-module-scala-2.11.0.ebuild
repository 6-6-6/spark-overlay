# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-module-scala_2.12-2.11.0.pom --download-uri https://repo.maven.apache.org/maven2/com/fasterxml/jackson/module/jackson-module-scala_2.12/2.11.0/jackson-module-scala_2.12-2.11.0-sources.jar --slot 2.12 --keywords "~amd64" --ebuild jackson-module-scala-2.11.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="jackson-module-scala"
HOMEPAGE="http://wiki.fasterxml.com/JacksonModuleScala"
SRC_URI="https://repo.maven.apache.org/maven2/com/fasterxml/jackson/module/${PN}_2.12/${PV}/${PN}_2.12-${PV}-sources.jar"
LICENSE=""
SLOT="2.12"
KEYWORDS="~amd64"
MAVEN_ID="com.fasterxml.jackson.module:jackson-module-scala_2.12:2.11.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}.pom
# com.fasterxml.jackson.core:jackson-annotations:2.11.0 -> >=dev-java/jackson-annotations-2.11.0:2
# com.fasterxml.jackson.core:jackson-core:2.11.0 -> >=dev-java/jackson-2.11.0:2
# com.fasterxml.jackson.core:jackson-databind:2.11.0 -> >=dev-java/jackson-databind-2.11.0:2
# com.fasterxml.jackson.module:jackson-module-paranamer:2.11.0 -> >=app-maven/jackson-module-paranamer-2.11.0:0
# org.scala-lang:scala-library:2.12.11 -> >=app-maven/scala-library-2.13.2:0

CDEPEND="
	>=app-maven/jackson-module-paranamer-2.11.0:0
	>=app-maven/scala-library-2.13.2:0
	>=dev-java/jackson-2.11.0:2
	>=dev-java/jackson-annotations-2.11.0:2
	>=dev-java/jackson-databind-2.11.0:2
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

JAVA_GENTOO_CLASSPATH="jackson-annotations-2,jackson-2,jackson-databind-2,jackson-module-paranamer,scala-library"
