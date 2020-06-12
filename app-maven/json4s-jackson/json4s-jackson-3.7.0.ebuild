# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/json4s-jackson_2.12-3.7.0-M4.pom --download-uri https://repo.maven.apache.org/maven2/org/json4s/json4s-jackson_2.12/3.7.0-M4/json4s-jackson_2.12-3.7.0-M4-sources.jar --slot 2.12 --keywords "~amd64" --ebuild json4s-jackson-3.7.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="json4s-jackson"
HOMEPAGE="https://github.com/json4s/json4s"
SRC_URI="https://repo.maven.apache.org/maven2/org/json4s/${PN}_2.12/${PV}-M4/${PN}_2.12-${PV}-M4-sources.jar"
LICENSE=""
SLOT="2.12"
KEYWORDS="~amd64"
MAVEN_ID="org.json4s:json4s-jackson_2.12:3.7.0-M4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}-M4.pom
# com.fasterxml.jackson.core:jackson-databind:2.11.0 -> >=dev-java/jackson-databind-2.11.0:0
# org.json4s:json4s-core_2.12:3.7.0-M4 -> >=app-maven/json4s-core-3.7.0:2.12
# org.scala-lang:scala-library:2.12.11 -> >=app-maven/scala-library-2.13.2:0

CDEPEND="
	>=app-maven/json4s-core-3.7.0:2.12
	>=app-maven/scala-library-2.13.2:0
	>=dev-java/jackson-databind-2.11.0:0
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

JAVA_GENTOO_CLASSPATH="jackson-databind,json4s-core-2.12,scala-library"
