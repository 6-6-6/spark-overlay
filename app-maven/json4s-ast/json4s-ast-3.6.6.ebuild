# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/json4s-ast_2.12-3.6.6.pom --download-uri https://repo.maven.apache.org/maven2/org/json4s/json4s-ast_2.12/3.6.6/json4s-ast_2.12-3.6.6-sources.jar --slot 2.12 --keywords "~amd64" --ebuild json4s-ast-3.6.6.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="json4s-ast"
HOMEPAGE="https://github.com/json4s/json4s"
SRC_URI="https://repo.maven.apache.org/maven2/org/json4s/${PN}_2.12/${PV}/${PN}_2.12-${PV}-sources.jar"
LICENSE=""
SLOT="2.12"
KEYWORDS="~amd64"
MAVEN_ID="org.json4s:json4s-ast_2.12:3.6.6"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}.pom
# org.scala-lang:scala-library:2.12.8 -> >=app-maven/scala-library-2.12.10:0

CDEPEND="
	>=app-maven/scala-library-2.12.10:0
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

JAVA_GENTOO_CLASSPATH="scala-library"
