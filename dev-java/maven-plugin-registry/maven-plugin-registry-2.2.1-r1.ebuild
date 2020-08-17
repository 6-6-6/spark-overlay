# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/maven-plugin-registry-2.2.1.pom --download-uri https://repo1.maven.org/maven2/org/apache/maven/maven-plugin-registry/2.2.1/maven-plugin-registry-2.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild maven-plugin-registry-2.2.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.maven:maven-plugin-registry:2.2.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Maven is a project development management and comprehension tool. Based on the concept of a project object model: builds, dependency management, documentation creation, site publication, and distribution publication are all controlled from the declarative file. Maven can be extended by plugins to utilise a number of other development tools for reporting or the build process."
HOMEPAGE="http://maven.apache.org/maven-plugin-registry"
SRC_URI="https://repo1.maven.org/maven2/org/apache/maven/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/maven/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.plexus:plexus-container-default:1.0-alpha-9-stable-1 -> >=dev-java/plexus-container-default-1.0.9.1:0
# org.codehaus.plexus:plexus-utils:1.5.15 -> >=dev-java/plexus-utils-1.5.15:0

CDEPEND="
	>=dev-java/plexus-container-default-1.0.9.1:0
	>=dev-java/plexus-utils-1.5.15:0
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

JAVA_GENTOO_CLASSPATH="plexus-container-default,plexus-utils"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
