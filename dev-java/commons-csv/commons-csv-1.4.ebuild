# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-csv-1.4.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/apache/commons/commons-csv/1.4/commons-csv-1.4-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/apache/commons/commons-csv/1.4/commons-csv-1.4.jar --slot 0 --keywords "~amd64" --ebuild commons-csv-1.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.commons:commons-csv:1.4"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The Apache Commons CSV library provides a simple interface for reading and writing CSV files of various types."
HOMEPAGE="http://commons.apache.org/proper/commons-csv/"
SRC_URI="https://repo1.maven.org/maven2/org/apache/commons/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/commons/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=(
	"src/main/resources"
)
JAVA_BINJAR_FILENAME="${P}-bin.jar"
