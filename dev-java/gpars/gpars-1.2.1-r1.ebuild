# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/gpars-1.2.1.pom --download-uri https://repo1.maven.org/maven2/org/codehaus/gpars/gpars/1.2.1/gpars-1.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild gpars-1.2.1-r1.ebuild

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.codehaus.gpars:gpars:1.2.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The GPars concurrency and parallelism framework for the JVM"
# www.gpars.org is not available in HTTPS
HOMEPAGE="https://github.com/GPars/GPars"
SRC_URI="https://repo1.maven.org/maven2/org/codehaus/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/codehaus/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Contains Groovy sources that cannot be compiled within Portage yet
IUSE="+binary"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.groovy:groovy-all:2.1.9 -> >=dev-java/groovy-all-2.4.0:0
# org.codehaus.jcsp:jcsp:1.1-rc5 -> >=dev-java/jcsp-1.1_rc5:0
# org.codehaus.jsr166-mirror:jsr166y:1.7.0 -> >=dev-java/jsr166y-1.7.0:0
# org.jboss.netty:netty:3.2.9.Final -> >=dev-java/netty-3.2.9:3.2
# org.multiverse:multiverse-core:0.7.0 -> >=dev-java/multiverse-core-0.7.0:0

CDEPEND="
	>=dev-java/groovy-all-2.4.0:0
	>=dev-java/jcsp-1.1_rc5:0
	>=dev-java/jsr166y-1.7.0:0
	>=dev-java/multiverse-core-0.7.0:0
	>=dev-java/netty-3.2.9:3.2
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

JAVA_GENTOO_CLASSPATH="groovy-all,jcsp,jsr166y,netty-3.2,multiverse-core"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
