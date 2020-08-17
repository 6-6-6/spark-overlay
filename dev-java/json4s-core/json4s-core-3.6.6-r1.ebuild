# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/json4s-core_2.12-3.6.6.pom --download-uri https://repo1.maven.org/maven2/org/json4s/json4s-core_2.12/3.6.6/json4s-core_2.12-3.6.6-sources.jar --slot 2.12 --keywords "~amd64" --ebuild json4s-core-3.6.6-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.json4s:json4s-core_2.12:3.6.6"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven java-pkg-simple-plugins

DESCRIPTION="json4s-core"
HOMEPAGE="https://github.com/json4s/json4s"
SRC_URI="https://repo1.maven.org/maven2/org/json4s/${PN}_2.12/${PV}/${PN}_2.12-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/json4s/${PN}_2.12/${PV}/${PN}_2.12-${PV}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="2.12"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}.pom
# com.thoughtworks.paranamer:paranamer:2.8 -> >=dev-java/paranamer-2.8:0
# org.json4s:json4s-ast_2.12:3.6.6 -> >=dev-java/json4s-ast-3.6.6:2.12
# org.json4s:json4s-scalap_2.12:3.6.6 -> >=dev-java/json4s-scalap-3.6.6:2.12
# org.scala-lang:scala-library:2.12.8 -> >=dev-java/scala-common-bin-2.12.4:2.12

CDEPEND="
	>=dev-java/json4s-ast-3.6.6:2.12
	>=dev-java/json4s-scalap-3.6.6:2.12
	>=dev-java/paranamer-2.8:0
	>=dev-java/scala-common-bin-2.12.4:2.12
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

JAVA_GENTOO_CLASSPATH="paranamer,json4s-ast-2.12,json4s-scalap-2.12,scala-common-bin-2.12"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_compile() {
	java-pkg-simple-plugins_src_compile
}
