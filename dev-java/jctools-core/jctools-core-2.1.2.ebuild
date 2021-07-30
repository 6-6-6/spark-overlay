# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /tmp/java-ebuilder/poms/jctools-core-2.1.2.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/jctools/jctools-core/2.1.2/jctools-core-2.1.2-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/jctools/jctools-core/2.1.2/jctools-core-2.1.2.jar --slot 2.1 --keywords "~amd64" --ebuild jctools-core-2.1.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jctools:jctools-core:2.1.2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Java Concurrency Tools Core Library"
HOMEPAGE="https://github.com/JCTools"
SRC_URI="
	https://repo1.maven.org/maven2/org/jctools/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/jctools/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="2.1"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
