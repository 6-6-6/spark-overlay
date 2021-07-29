# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.projectlombok:lombok:1.16.16"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Automatic resource management and method generation"
HOMEPAGE="https://projectlombok.org"
SRC_URI="
	https://repo1.maven.org/maven2/org/project${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/project${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# Dependencies are incomplete yet.  JARs containing the following Java packages
# are still needed:
# - org.mangosdk.spi
# - lombok.patcher
# - org.eclipse.core.runtime
# - org.eclipse.jdt
IUSE="+binary"

CP_DEPEND="
	dev-java/ant-core:0
	dev-java/eclipse-ecj:4.5
	dev-java/junit:4
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
		dev-java/cmdreader:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_NEEDS_TOOLS=1
JAVA_CLASSPATH_EXTRA="cmdreader"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
