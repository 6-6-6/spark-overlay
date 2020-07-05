# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/rxtx-2.1.7.pom --download-uri https://repo.maven.apache.org/maven2/org/rxtx/rxtx/2.1.7/rxtx-2.1.7.jar --slot 0 --keywords "~amd64" --ebuild rxtx-2.1.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="RXTX is a native lib providing serial and parallel communication for the Java Development Toolkit (JDK)."
HOMEPAGE="http://www.rxtx.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/${PN}/${PN}/${PV}/${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.rxtx:rxtx:2.1.7"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
