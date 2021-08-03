# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="org.apache.lucene:lucene-core:${PV}"

JAVA_PKG_IUSE="doc source binary test"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN="lucene-core"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Apache Lucene Java Core"
HOMEPAGE="https://lucene.apache.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/lucene/${MY_PN}/${PV}/${MY_P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/lucene/${MY_PN}/${PV}/${MY_P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

# Without these, JAPICC would not pass: The return type of some methods in
# interface CharTermAttribute would change from CharTermAttribute to Appendable
JAVA_PKG_WANT_SOURCE="1.7"
JAVA_PKG_WANT_TARGET="1.7"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
