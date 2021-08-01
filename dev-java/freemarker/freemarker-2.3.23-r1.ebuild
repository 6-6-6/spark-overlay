# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/freemarker-2.3.23.pom --download-uri https://repo1.maven.org/maven2/org/freemarker/freemarker/2.3.23/freemarker-2.3.23-sources.jar --slot 0 --keywords "~amd64" --ebuild freemarker-2.3.23-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.freemarker:freemarker:2.3.23"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="A generic tool to generate text output based on templates"
HOMEPAGE="https://freemarker.apache.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# The source JAR from Maven Central does not contain class
# freemarker.core.FMParser, which is both included in the binary JAR and needed
# by other classes.  The upstream project source tree contains this class, but
# it uses Ivy and nearly two dozens of dependencies, making it hard to build
# this package from source within Portage.
IUSE="+binary"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
