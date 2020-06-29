# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/gpars-1.2.1.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/gpars/gpars/1.2.1/gpars-1.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild gpars-1.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Groovy and Java high-level concurrency library offering actors, dataflow, CSP, agents, parallel collections, fork/join and more"
HOMEPAGE="http://gpars.codehaus.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.gpars:gpars:1.2.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.groovy:groovy-all:2.1.9 -> >=dev-java/groovy-all-2.5.12:0
# org.codehaus.jcsp:jcsp:1.1-rc5 -> >=app-maven/jcsp-1.1_rc5:0
# org.codehaus.jsr166-mirror:jsr166y:1.7.0 -> >=app-maven/jsr166y-1.7.0:0
# org.jboss.netty:netty:3.2.9.Final -> >=app-maven/netty-3.2.9:0
# org.multiverse:multiverse-core:0.7.0 -> >=app-maven/multiverse-core-0.7.0:0

CDEPEND="
	>=app-maven/jcsp-1.1_rc5:0
	>=app-maven/jsr166y-1.7.0:0
	>=app-maven/multiverse-core-0.7.0:0
"
#	>=app-maven/netty-3.2.9:0
#	>=dev-java/groovy-all-2.5.12:0


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jcsp,jsr166y,multiverse-core"
