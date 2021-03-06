# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/htrace-core-3.1.0-incubating.pom --download-uri https://repo1.maven.org/maven2/org/apache/htrace/htrace-core/3.1.0-incubating/htrace-core-3.1.0-incubating-sources.jar --slot 0 --keywords "~amd64" --ebuild htrace-core-3.1.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.htrace:htrace-core:3.1.0-incubating"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="A tracing framework for use with distributed systems written in java"
HOMEPAGE="http://incubator.apache.org/projects/htrace.html"
SRC_URI="https://repo1.maven.org/maven2/org/apache/htrace/${PN}/${PV}-incubating/${P}-incubating-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/htrace/${PN}/${PV}-incubating/${P}-incubating.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-incubating.pom
# com.google.guava:guava:12.0.1 -> >=dev-java/guava-29.0:0
# commons-logging:commons-logging:1.1.1 -> >=dev-java/commons-logging-1.2:0
# org.mortbay.jetty:jetty-util:6.1.26 -> >=dev-java/jetty-util-6.1.26:6

CDEPEND="
	>=dev-java/jetty-util-6.1.26:6
	>=dev-java/commons-logging-1.2:0
	>=dev-java/guava-29.0:0
	dev-java/jackson-databind:0
	dev-java/jackson:2
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

JAVA_GENTOO_CLASSPATH="guava,commons-logging,jetty-util-6,jackson-databind,jackson-2"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
