# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/pyrolite-4.30.pom --download-uri https://repo1.maven.org/maven2/net/razorvine/pyrolite/4.30/pyrolite-4.30-sources.jar --slot 0 --keywords "~amd64" --ebuild pyrolite-4.30-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="net.razorvine:pyrolite:4.30"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="This library allows your Java program to interface very easily with the Python world. It uses the Pyro protocol to call methods on remote objects. (See https://github.com/irmen/Pyro4). To that end, it also contains and uses a feature complete pickle protocol implementation -read and write- to exchange data with Pyro/Python.  Pyrolite only implements part of the client side Pyro library, hence its name 'lite'...  But because Pyrolite has no dependencies, it is a much lighter way to use Pyro from Java/.NET than a solution with jython+pyro or IronPython+Pyro would provide. So if you don't need Pyro's full feature set, and don't require your Java/.NET code to host Pyro objects itself, Pyrolite may be a good choice to connect java or .NET and python.  (More info about Pyro itself: https://pyro4.readthedocs.io/ )  Version 4.30 changes: Support for unpickling protocol 5 pickles with out-of-band buffers (Python 3.8)"
HOMEPAGE="https://github.com/irmen/Pyrolite"
SRC_URI="https://repo1.maven.org/maven2/net/razorvine/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/net/razorvine/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# net.razorvine:serpent:1.23 -> >=dev-java/serpent-1.23:0

CDEPEND="
	>=dev-java/serpent-1.23:0
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

JAVA_GENTOO_CLASSPATH="serpent"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
