# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jta-1.1.pom --download-uri https://repo1.maven.org/maven2/javax/transaction/jta/1.1/jta-1.1-sources.jar --slot 0 --keywords "~amd64" --ebuild jta-1.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="javax.transaction:jta:1.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The javax.transaction package. It is appropriate for inclusion in a classpath, and may be added to a Java 2 installation."
HOMEPAGE="http://java.sun.com/products/jta"
SRC_URI="https://repo1.maven.org/maven2/javax/transaction/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/javax/transaction/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
# totally not sure
LICENSE="CDDL"
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
