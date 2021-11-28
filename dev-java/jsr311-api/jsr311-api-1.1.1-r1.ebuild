# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="javax.ws.rs:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JAX-RS: Java API for RESTful Web Services"
HOMEPAGE="https://jcp.org/en/jsr/detail?id=311"
SRC_URI="
	https://repo1.maven.org/maven2/javax/ws/rs/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/javax/ws/rs/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="CDDL"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"

BDEPEND="
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

DEPEND="
	>=virtual/jdk-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
