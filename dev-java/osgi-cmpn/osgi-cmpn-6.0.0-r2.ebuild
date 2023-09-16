# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.osgi:osgi.cmpn:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="OSGi Compendium Release 6, Interfaces and Classes for use in compiling bundles"
HOMEPAGE="https://www.osgi.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/osgi/osgi.cmpn/${PV}/osgi.cmpn-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/osgi/osgi.cmpn/${PV}/osgi.cmpn-${PV}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="6"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/osgi-annotation:6
	dev-java/osgi-framework:1

	dev-java/glassfish-persistence:0
	dev-java/jakarta-servlet-api:4
	dev-java/microemu-cldc:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
