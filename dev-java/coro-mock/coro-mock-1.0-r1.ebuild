# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/coro-mock-1.0.pom --download-uri https://repo1.maven.org/maven2/com/headius/coro-mock/1.0/coro-mock-1.0-sources.jar --slot 0 --keywords "~amd64" --ebuild coro-mock-1.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.headius:coro-mock:1.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Sonatype helps open source projects to set up Maven repositories on https://oss.sonatype.org/"
HOMEPAGE="https://github.com/headius/coro-mock"
SRC_URI="https://repo1.maven.org/maven2/com/headius/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/headius/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
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
