# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/gpars-1.0.0.pom --download-uri https://repo1.maven.org/maven2/org/codehaus/gpars/gpars/1.0.0/gpars-1.0.0-sources.jar --slot 0 --keywords "~amd64" --ebuild gpars-1.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.codehaus.gpars:gpars:1.0.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The Groovy and Java high-level concurrency library offering actors, dataflow, CSP, agents, parallel collections, fork/join and more"
HOMEPAGE="http://gpars.codehaus.org"
SRC_URI="https://repo1.maven.org/maven2/org/codehaus/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/codehaus/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.jcsp:jcsp:1.1-rc5 -> >=dev-java/jcsp-1.1_rc5:0
# org.codehaus.jsr166-mirror:jsr166y:1.7.0 -> >=dev-java/jsr166y-1.7.0:0
# org.jboss.netty:netty:3.2.7.Final -> >=dev-java/netty-3.2.7:3.2
# org.multiverse:multiverse-beta:0.7-RC-1 -> >=dev-java/multiverse-beta-0.7:0

CDEPEND="
	>=dev-java/jcsp-1.1_rc5:0
	>=dev-java/jsr166y-1.7.0:0
	>=dev-java/multiverse-beta-0.7:0
	>=dev-java/netty-3.2.7:3.2
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

JAVA_GENTOO_CLASSPATH="jcsp,jsr166y,netty-3.2,multiverse-beta"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
