# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="ch.qos.logback:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="logback-classic module"
HOMEPAGE="https://logback.qos.ch/"
SRC_URI="
	https://repo1.maven.org/maven2/ch/qos/logback/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/ch/qos/logback/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="|| ( EPL-1.0 LGPL-2.1 )"
SLOT="0"
KEYWORDS="~amd64"

# Minor method signature inconsistencies between compiled and pre-built JARs,
# failing pkgdiff tests
RESTRICT="test"

CP_DEPEND="
	>=dev-java/groovy-all-2.4.0:0
	>=dev-java/logback-core-1.2.3:0
	>=dev-java/mail-1.4:0
	>=dev-java/janino-3.0.6:0
	>=dev-java/slf4j-api-1.7.28:0
	java-virtuals/servlet-api:4.0
"

BDEPEND="
	app-arch/unzip
"

# Depends on sun.reflect.Reflection, which is no longer available on Java 11
# This is still true for version 1.2.10 -- latest release as of January 2022
DEPEND="
	virtual/jdk:1.8
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	virtual/jre:1.8
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
