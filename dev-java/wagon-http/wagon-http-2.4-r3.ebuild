# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.maven.wagon:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Wagon that gets and puts artifacts through http using Apache httpclient-4.x"
HOMEPAGE="https://maven.apache.org/wagon/wagon-providers/wagon-http/"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/maven/wagon/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/maven/wagon/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/wagon-http-shared4-2.4:0
	>=dev-java/wagon-provider-api-2.4:0
	>=dev-java/httpcomponents-client-4.5:4
	>=dev-java/httpcore-4.4.1:0
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
