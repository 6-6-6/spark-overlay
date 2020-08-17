# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/reactive-streams-1.0.2.pom --download-uri https://repo1.maven.org/maven2/org/reactivestreams/reactive-streams/1.0.2/reactive-streams-1.0.2-sources.jar --slot 0 --keywords "~amd64" --ebuild reactive-streams-1.0.2-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.reactivestreams:reactive-streams:1.0.2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="A Protocol for Asynchronous Non-Blocking Data Sequence"
HOMEPAGE="http://www.reactive-streams.org/"
SRC_URI="https://repo1.maven.org/maven2/org/reactivestreams/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/reactivestreams/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="CC0-1.0"
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
