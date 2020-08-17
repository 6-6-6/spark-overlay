# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/plexus-utils-1.5.15.pom --download-uri https://repo1.maven.org/maven2/org/codehaus/plexus/plexus-utils/1.5.15/plexus-utils-1.5.15-sources.jar --slot 0 --keywords "~amd64" --ebuild plexus-utils-1.5.15-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.codehaus.plexus:plexus-utils:1.5.15"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="A collection of various utility classes to ease working with strings, files, command lines, XML and more."
HOMEPAGE="http://plexus.codehaus.org/plexus-utils"
SRC_URI="https://repo1.maven.org/maven2/org/codehaus/plexus/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/codehaus/plexus/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.plexus:plexus-interpolation:1.11 -> >=dev-java/plexus-interpolation-1.11:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		>=dev-java/plexus-interpolation-1.11:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="plexus-interpolation"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
