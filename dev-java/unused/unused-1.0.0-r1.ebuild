# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/unused-1.0.0.pom --download-uri https://repo1.maven.org/maven2/org/spark-project/spark/unused/1.0.0/unused-1.0.0-sources.jar --slot 0 --keywords "~amd64" --ebuild unused-1.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.spark-project.spark:unused:1.0.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Sonatype helps open source projects to set up Maven repositories on https://oss.sonatype.org/"
HOMEPAGE="http://nexus.sonatype.org/oss-repository-hosting.html/unused"
SRC_URI="https://repo1.maven.org/maven2/org/spark-project/spark/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/spark-project/spark/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
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
