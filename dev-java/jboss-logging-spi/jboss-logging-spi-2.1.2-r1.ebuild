# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-logging-spi-2.1.2.GA.pom --download-uri https://repo1.maven.org/maven2/org/jboss/logging/jboss-logging-spi/2.1.2.GA/jboss-logging-spi-2.1.2.GA-sources.jar --slot 0 --keywords "~amd64" --ebuild jboss-logging-spi-2.1.2-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jboss.logging:jboss-logging-spi:2.1.2.GA"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The JBoss Logging Framework Programming Interface"
HOMEPAGE="http://www.jboss.org"
SRC_URI="https://repo1.maven.org/maven2/org/jboss/logging/${PN}/${PV}.GA/${P}.GA-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/logging/${PN}/${PV}.GA/${P}.GA.jar -> ${P}-bin.jar"
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
