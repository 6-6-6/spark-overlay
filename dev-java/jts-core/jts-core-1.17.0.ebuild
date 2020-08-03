# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jts-core-1.17.0.pom --download-uri https://repo1.maven.org/maven2/org/locationtech/jts/jts-core/1.17.0/jts-core-1.17.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jts-core-1.17.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary test"
MAVEN_ID="org.locationtech.jts:jts-core:1.17.0"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The JTS Topology Suite is an API for 2D linear geometry predicates and functions."
HOMEPAGE="https://www.locationtech.org/projects/technology.jts/jts-modules/jts-core"
SRC_URI="https://repo1.maven.org/maven2/org/locationtech/jts/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/locationtech/jts/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="EPL-2.0 EPL-1.0"
SLOT="1"
KEYWORDS="~amd64 ~x86"

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
