# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/pyrolite-5.0.pom --download-uri https://repo.maven.apache.org/maven2/net/razorvine/pyrolite/5.0/pyrolite-5.0-sources.jar --slot 0 --keywords "~amd64" --ebuild pyrolite-5.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="This library allows your Java program to interface very easily with the Python world. It uses the Pyro protocol to call methods on remote objects. (See https://pyro5.readthedocs.io/).

Pyrolite only implements part of the client side Pyro library, hence its name 'lite'... So if you don't need Pyro's full feature set, Pyrolite may be a good choice to connect java or .NET and python.

Version 5.0 changes: support Pyro5 wire protocol. Dropped support of Pyro4 (stick to version 4.xx for that)."
HOMEPAGE="https://github.com/irmen/Pyrolite"
SRC_URI="https://repo.maven.apache.org/maven2/net/razorvine/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="net.razorvine:pyrolite:5.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# net.razorvine:serpent:1.30 -> >=app-maven/serpent-1.30:0

CDEPEND="
	>=app-maven/serpent-1.30:0
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

JAVA_GENTOO_CLASSPATH="serpent"
