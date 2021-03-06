# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jeromq-0.3.5.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/zeromq/jeromq/0.3.5/jeromq-0.3.5-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/zeromq/jeromq/0.3.5/jeromq-0.3.5.jar --slot 0 --keywords "~amd64" --ebuild jeromq-0.3.5.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.zeromq:jeromq:0.3.5"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Pure Java implementation of libzmq"
HOMEPAGE="https://github.com/zeromq/jeromq"
SRC_URI="https://repo1.maven.org/maven2/org/zeromq/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/zeromq/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="LGPL-3"
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
