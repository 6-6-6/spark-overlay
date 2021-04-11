# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/htrace-core4-4.1.0-incubating.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/apache/htrace/htrace-core4/4.1.0-incubating/htrace-core4-4.1.0-incubating-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/apache/htrace/htrace-core4/4.1.0-incubating/htrace-core4-4.1.0-incubating.jar --slot 0 --keywords "~amd64" --ebuild htrace-core4-4.1.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.htrace:htrace-core4:4.1.0-incubating"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="A distributed tracing framework."
HOMEPAGE="http://incubator.apache.org/projects/htrace.html"
SRC_URI="https://repo1.maven.org/maven2/org/apache/htrace/${PN}/${PV}-incubating/${P}-incubating-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/htrace/${PN}/${PV}-incubating/${P}-incubating.jar -> ${P}-bin.jar"
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
