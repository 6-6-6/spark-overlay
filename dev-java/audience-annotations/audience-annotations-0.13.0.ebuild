# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.yetus:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Annotations for defining API boundaries and tools for managing javadocs"
HOMEPAGE="https://yetus.apache.org/audience-annotations"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/yetus/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/yetus/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/unzip
"

# Depends on com.sun.tools.doclets.standard.Standard.validOptions(),
# which is no longer available on Java 11
DEPEND="
	virtual/jdk:1.8
"

RDEPEND="
	virtual/jre:1.8
"

S="${WORKDIR}"

JAVA_NEEDS_TOOLS=1
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
