# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source binary test"
MAVEN_ID="org.jboss.marshalling:jboss-marshalling:1.3.18.GA"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Compatible alternative to the JDK serialization API"
HOMEPAGE="https://jbossmarshalling.jboss.org/"
SRC_URI="https://repo1.maven.org/maven2/org/jboss/marshalling/${PN}/${PV}.GA/${P}.GA-sources.jar -> ${P}-sources.jar
		https://repo1.maven.org/maven2/org/jboss/marshalling/${PN}/${PV}.GA/${P}.GA.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CDEPEND="
	dev-java/jboss-modules:0
"

RDEPEND="${CDEPEND}
	>=virtual/jre-1.8
"

DEPEND="${CDEPEND}
	>=virtual/jdk-1.8
"

JAVA_SRC_DIR="src/main/java"
JAVA_GENTOO_CLASSPATH="jboss-modules"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
