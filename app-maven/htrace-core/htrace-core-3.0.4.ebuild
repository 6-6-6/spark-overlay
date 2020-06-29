# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/htrace-core-3.0.4.pom --download-uri https://repo.maven.apache.org/maven2/org/htrace/htrace-core/3.0.4/htrace-core-3.0.4-sources.jar --slot 0 --keywords "~amd64" --ebuild htrace-core-3.0.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Tracing library"
HOMEPAGE="https://github.com/cloudera/htrace"
SRC_URI="https://repo.maven.apache.org/maven2/org/htrace/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.htrace:htrace-core:3.0.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava:12.0.1 -> >=dev-java/guava-20.0:0
# commons-logging:commons-logging:1.1.1 -> >=dev-java/commons-logging-1.2:0
# org.mortbay.jetty:jetty-util:6.1.26 -> >=app-maven/jetty-util-6.1.26:0

CDEPEND="
	>=app-maven/jetty-util-6.1.26:0
	>=dev-java/commons-logging-1.2:0
	>=dev-java/guava-20.0:0
"


DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guava-${PV%.*},commons-logging,jetty-util"
