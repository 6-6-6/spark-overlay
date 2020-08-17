# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/maven-plugin-annotations-3.2.pom --download-uri https://repo1.maven.org/maven2/org/apache/maven/plugin-tools/maven-plugin-annotations/3.2/maven-plugin-annotations-3.2-sources.jar --slot 0 --keywords "~amd64" --ebuild maven-plugin-annotations-3.2-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.maven.plugin-tools:maven-plugin-annotations:3.2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Java 5 annotations to use in Mojos."
HOMEPAGE="http://maven.apache.org/plugin-tools/maven-plugin-annotations/"
SRC_URI="https://repo1.maven.org/maven2/org/apache/maven/plugin-tools/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/maven/plugin-tools/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.maven:maven-artifact:3.0 -> >=dev-java/maven-artifact-3.0:0

CDEPEND="
	>=dev-java/maven-artifact-3.0:0
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

JAVA_GENTOO_CLASSPATH="maven-artifact"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
