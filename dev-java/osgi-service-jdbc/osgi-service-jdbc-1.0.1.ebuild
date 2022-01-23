# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source binary test"
MAVEN_ID="org.osgi:org.osgi.service.jdbc:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN="org.${PN//-/.}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="OSGi Companion Code for org.osgi.service.jdbc"
HOMEPAGE="https://www.osgi.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/osgi/${MY_PN}/${PV}/${MY_P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/osgi/${MY_PN}/${PV}/${MY_P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Pre-built JAR contains Java source files, which we should never add to our
# generated JAR, thus pkgdiff comparison might never pass
RESTRICT="test"

CP_DEPEND="
	dev-java/osgi-annotation:6
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
