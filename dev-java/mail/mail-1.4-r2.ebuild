# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="javax.mail:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Platform- and protocol-independent framework for mail and messaging applications"
HOMEPAGE="https://javaee.github.io/javamail/"
SRC_URI="
	https://repo1.maven.org/maven2/javax/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/javax/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="CDDL"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/jakarta-activation-api:1
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
