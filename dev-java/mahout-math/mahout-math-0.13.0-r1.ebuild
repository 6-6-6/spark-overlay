# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/mahout-math-0.13.0.pom --download-uri https://repo1.maven.org/maven2/org/apache/mahout/mahout-math/0.13.0/mahout-math-0.13.0-sources.jar --slot 0 --keywords "~amd64" --ebuild mahout-math-0.13.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.mahout:mahout-math:0.13.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="High performance scientific and technical computing data structures and methods, mostly based on CERN's Colt Java API"
HOMEPAGE="http://mahout.apache.org/mahout-math"
SRC_URI="https://repo1.maven.org/maven2/org/apache/mahout/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/mahout/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava:14.0.1 -> >=dev-java/guava-29.0:0
# com.tdunning:t-digest:3.1 -> >=dev-java/t-digest-3.1:0
# it.unimi.dsi:fastutil:7.0.12 -> >=dev-java/fastutil-8.1.1:0
# org.apache.commons:commons-math3:3.2 -> >=dev-java/commons-math-3.2:3
# org.slf4j:slf4j-api:1.7.22 -> >=dev-java/slf4j-api-1.7.28:0

CDEPEND="
	>=dev-java/t-digest-3.1:0
	>=dev-java/commons-math-3.2:3
	>=dev-java/fastutil-8.1.1:0
	>=dev-java/guava-29.0:0
	>=dev-java/slf4j-api-1.7.28:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guava,t-digest,fastutil,commons-math-3,slf4j-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_prepare() {
	java-pkg-2_src_prepare

	sed -i "s/CharMatcher.WHITESPACE/CharMatcher.whitespace()/"\
		${JAVA_SRC_DIR}/org/apache/mahout/math/random/IndianBuffet.java\
		|| die
}
