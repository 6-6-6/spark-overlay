# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/nailgun-server-0.9.1.pom --download-uri https://repo1.maven.org/maven2/com/martiansoftware/nailgun-server/0.9.1/nailgun-server-0.9.1-sources.jar --slot 0 --keywords "~amd64" --ebuild nailgun-server-0.9.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.martiansoftware:nailgun-server:0.9.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Nailgun is a client, protocol, and server for running Java programs from the command line without incurring the JVM startup overhead. Programs run in the server (which is implemented in Java), and are triggered by the client (written in C), which handles all I/O.  This project contains the SERVER ONLY."
HOMEPAGE="http://martiansoftware.com/nailgun"
SRC_URI="https://repo1.maven.org/maven2/com/martiansoftware/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/martiansoftware/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
