# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/clover-4.2.1.pom --download-uri https://repo1.maven.org/maven2/org/openclover/clover/4.2.1/clover-4.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild clover-4.2.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.openclover:clover:4.2.1"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Clover is an award winning code coverage and testing tool for Java and Groovy. It integrates easily with Maven, Ant, Grails, Eclipse and IntelliJ IDEA as well as with continuous integration servers such as Bamboo, Jenkins or Hudson.  Note: before Clover 4.0 this artifact was named com.cenqua.clover:clover."
HOMEPAGE="http://openclover.org"
SRC_URI="https://repo1.maven.org/maven2/org/open${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/open${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CDEPEND="dev-java/jetbrains-annotations:0"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	${CDEPEND}
	test? (
		amd64? (
			dev-util/japi-compliance-checker
			dev-util/pkgdiff
		)
	)"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jetbrains-annotations"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_TESTING_FRAMEWORKS="pkgdiff"
