# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/multiverse-beta-0.7-RC-1.pom --download-uri https://repo.maven.apache.org/maven2/org/multiverse/multiverse-beta/0.7-RC-1/multiverse-beta-0.7-RC-1.jar --slot 0 --keywords "~amd64" --ebuild multiverse-beta-0.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/multiverse/${PN}/${PV}-RC-1/${P}-RC-1.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.multiverse:multiverse-beta:0.7-RC-1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-RC-1.pom
# junit:junit:4.8.1 -> >=dev-java/junit-4.12:4

CDEPEND="
	>=dev-java/junit-4.12:4
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

JAVA_GENTOO_CLASSPATH="junit-4"
JAVA_SRC_DIR="src/main/java"

JAVA_TESTING_FRAMEWORK="junit"
