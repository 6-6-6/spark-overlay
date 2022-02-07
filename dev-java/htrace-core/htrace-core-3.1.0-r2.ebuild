# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.htrace:${PN}:${PV}-incubating"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="A tracing framework for use with distributed systems written in java"
HOMEPAGE="https://incubator.apache.org/projects/htrace.html"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/htrace/${PN}/${PV}-incubating/${P}-incubating-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/htrace/${PN}/${PV}-incubating/${P}-incubating.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/jetty-util-6.1.26:6
	>=dev-java/commons-logging-1.2:0
	>=dev-java/guava-29.0:0
	dev-java/jackson-core:0
	dev-java/jackson-databind:0
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
