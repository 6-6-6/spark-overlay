# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-math3-3.6.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/commons/commons-math3/3.6.1/commons-math3-3.6.1-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-math3-3.6.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary test"
MAVEN_ID="org.apache.commons:commons-math3:3.6.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN=${PN}3

DESCRIPTION="The Apache Commons Math project is a library of lightweight, self-contained mathematics and statistics components addressing the most common practical problems not immediately available in the Java programming language or commons-lang."
HOMEPAGE="http://commons.apache.org/proper/commons-math/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/commons/${MY_PN}/${PV}/${MY_PN}-${PV}-sources.jar -> ${P}-sources.jar
		https://repo.maven.apache.org/maven2/org/apache/commons/${MY_PN}/${PV}/${MY_PN}-${PV}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="3"
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
