# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jeromq-0.5.2.pom --download-uri https://repo.maven.apache.org/maven2/org/zeromq/jeromq/0.5.2/jeromq-0.5.2-sources.jar --slot 0 --keywords "~amd64" --ebuild jeromq-0.5.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Pure Java implementation of libzmq"
HOMEPAGE="https://github.com/zeromq/jeromq"
SRC_URI="https://repo.maven.apache.org/maven2/org/zeromq/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.zeromq:jeromq:0.5.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# eu.neilalexander:jnacl:1.0.0 -> >=app-maven/jnacl-1.0.0:0

CDEPEND="
	>=app-maven/jnacl-1.0.0:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jnacl"
