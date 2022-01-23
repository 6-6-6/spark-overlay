# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.googlecode.matrix-toolkits-java:mtj:${PV}"
JAVA_TESTING_FRAMEWORKS="junit junit-4 pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN="mtj"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Matrix data structures, linear solvers, least squares methods, eigenvalue, SVDs"
HOMEPAGE="https://github.com/fommil/matrix-toolkits-java/"
SRC_URI="
	https://github.com/fommil/matrix-toolkits-java/archive/refs/tags/${MY_P}.tar.gz -> ${P}.tar.gz
	https://repo1.maven.org/maven2/com/googlecode/matrix-toolkits-java/${MY_PN}/${PV}/${MY_P}.jar -> ${P}-bin.jar
"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/fommil-netlib-core-1.1.2:0
"

BUILD_CP_DEPEND="
	${CP_DEPEND}
	>=dev-java/fommil-java-logging-1.1:0
	dev-java/lombok-bin:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${BUILD_CP_DEPEND}
	)
	test? (
		${BUILD_CP_DEPEND}
		>=dev-java/guava-29.0:0
		dev-java/opencsv:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/matrix-toolkits-java-${MY_P}"

JAVA_CLASSPATH_EXTRA="fommil-java-logging,lombok-bin"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TEST_GENTOO_CLASSPATH="junit,junit-4,guava,opencsv"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS="src/test/resources"
