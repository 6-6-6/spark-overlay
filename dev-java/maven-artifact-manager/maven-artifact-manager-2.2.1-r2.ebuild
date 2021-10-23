# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.maven:maven-artifact-manager:2.2.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Maven Artifact Manager"
HOMEPAGE="https://maven.apache.org/ref/2.2.1/maven-artifact-manager/"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/maven/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/maven/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/maven-artifact-2.2.1:2.2
	>=dev-java/maven-repository-metadata-2.2.1:0
	>=dev-java/plexus-container-default-1.0.9.1:0
	>=dev-java/plexus-utils-1.5.15:0
	>=dev-java/wagon-provider-api-1.0_beta6:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_prepare() {
	default

	find -name "*.java" -exec \
		sed -i -e 's/edu.emory.mathcs.backport.//g' {} \; || \
		die "Failed to modify import statements in source files"
}
