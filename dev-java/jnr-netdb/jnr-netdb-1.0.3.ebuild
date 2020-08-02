# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jnr-netdb-1.0.3.pom --download-uri https://repo1.maven.org/maven2/org/jruby/extras/jnr-netdb/1.0.3/jnr-netdb-1.0.3.jar --slot 0 --keywords "~amd64" --ebuild jnr-netdb-1.0.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Lookup TCP and UDP services from java"
HOMEPAGE="http://github.com/wmeissner/jnr-netdb"
SRC_URI="https://repo1.maven.org/maven2/org/jruby/extras/${PN}/${PV}/${P}.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jruby.extras:jnr-netdb:1.0.3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.jruby.extras:jaffl:0.5.9 -> >=dev-java/jaffl-0.5.11:0

CDEPEND="
	>=dev-java/jaffl-0.5.11:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jaffl"
JAVA_SRC_DIR="src/main/java"
