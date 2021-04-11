# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/guava-jdk5-17.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/google/guava/guava-jdk5/17.0/guava-jdk5-17.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/google/guava/guava-jdk5/17.0/guava-jdk5-17.0.jar --slot 0 --keywords "~amd64" --ebuild guava-jdk5-17.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.google.guava:guava-jdk5:17.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Guava is a suite of core and expanded libraries that include utility classes, google's collections, io classes, and much much more. Guava has only one code dependency - javax.annotation, per the JSR-305 spec."
HOMEPAGE="http://code.google.com/p/guava-libraries/guava-jdk5"
SRC_URI="https://repo1.maven.org/maven2/com/google/guava/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/google/guava/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.findbugs:jsr305:1.3.9 -> >=dev-java/jsr305-3.0.1:0

CDEPEND="
	>=dev-java/jsr305-3.0.1:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava-bootstrap-jdk5:17.0 -> >=dev-java/guava-bootstrap-jdk5-17.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/guava-bootstrap-jdk5-17.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jsr305"
JAVA_CLASSPATH_EXTRA="guava-bootstrap-jdk5"
JAVA_SRC_DIR="src"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
