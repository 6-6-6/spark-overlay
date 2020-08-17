# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/LatencyUtils-2.0.3.pom --download-uri https://repo1.maven.org/maven2/org/latencyutils/LatencyUtils/2.0.3/LatencyUtils-2.0.3-sources.jar --slot 0 --keywords "~amd64" --ebuild LatencyUtils-2.0.3-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.latencyutils:LatencyUtils:2.0.3"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="LatencyUtils is a package that provides latency recording and reporting utilities."
HOMEPAGE="http://latencyutils.github.io/LatencyUtils/"
SRC_URI="https://repo1.maven.org/maven2/org/latencyutils/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/latencyutils/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.hdrhistogram:HdrHistogram:2.1.8 -> >=dev-java/HdrHistogram-2.1.9:0

CDEPEND="
	>=dev-java/HdrHistogram-2.1.9:0
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

JAVA_GENTOO_CLASSPATH="HdrHistogram"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
