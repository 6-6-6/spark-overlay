# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/compiler-0.8.17.pom --download-uri https://repo1.maven.org/maven2/com/github/spullara/mustache/java/compiler/0.8.17/compiler-0.8.17-sources.jar --slot 0 --keywords "~amd64" --ebuild compiler-0.8.17-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.github.spullara.mustache.java:compiler:0.8.17"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Implementation of mustache.js for Java"
HOMEPAGE="http://github.com/spullara/mustache.java"
SRC_URI="https://repo1.maven.org/maven2/com/github/spullara/mustache/java/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/github/spullara/mustache/java/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava:16.0.1 -> >=dev-java/guava-29.0:0

CDEPEND="
	>=dev-java/guava-29.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.jruby:jruby:1.6.7 -> >=dev-java/jruby-1.6.7:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/jruby-1.6.7:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guava"
JAVA_CLASSPATH_EXTRA="jruby"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
