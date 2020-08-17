# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/py4j-0.10.8.1.pom --download-uri https://repo1.maven.org/maven2/net/sf/py4j/py4j/0.10.8.1/py4j-0.10.8.1-sources.jar --slot 0 --keywords "~amd64" --ebuild py4j-0.10.8.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="net.sf.py4j:py4j:0.10.8.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Py4J enables Python programs running in a Python interpreter to dynamically access Java objects in a Java Virtual Machine. Methods are called as if the Java objects resided in the Python interpreter and Java collections can be accessed through standard Python collection methods. Py4J also enables Java programs to call back Python objects."
HOMEPAGE="http://nexus.sonatype.org/oss-repository-hosting.html/py4j"
SRC_URI="https://repo1.maven.org/maven2/net/sf/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/net/sf/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="BSD"
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
JAVA_BINJAR_FILENAME="${P}-bin.jar"
