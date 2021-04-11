# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/auto-common-0.8.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/google/auto/auto-common/0.8/auto-common-0.8-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/google/auto/auto-common/0.8/auto-common-0.8.jar --slot 0 --keywords "~amd64" --ebuild auto-common-0.8.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.google.auto:auto-common:0.8"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Common utilities for creating annotation processors."
HOMEPAGE="https://github.com/google/auto/auto-common"
SRC_URI="https://repo1.maven.org/maven2/com/google/auto/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/google/auto/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.guava:guava:19.0 -> >=dev-java/guava-20.0:20

CDEPEND="
	>=dev-java/guava-20.0:20
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

JAVA_GENTOO_CLASSPATH="guava-20"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
