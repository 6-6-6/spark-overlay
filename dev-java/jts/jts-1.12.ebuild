# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /tmp/java-ebuilder/poms/jts-1.12.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/vividsolutions/jts/1.12/jts-1.12-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/vividsolutions/jts/1.12/jts-1.12.jar --slot 0 --keywords "~amd64" --ebuild jts-1.12.ebuild

EAPI=7

MAVEN_ID="com.vividsolutions:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="API for modelling and manipulating 2-dimensional linear geometry"
HOMEPAGE="https://sourceforge.net/projects/jts-topo-suite"
SRC_URI="
	https://repo1.maven.org/maven2/com/vividsolutions/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/vividsolutions/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="LGPL-3"
SLOT="${PV}"
KEYWORDS="~amd64"

# Common dependencies
# POM: /tmp/java-ebuilder/poms/${P}.pom
# xerces:xercesImpl:2.4.0 -> dev-java/xerces:2

CP_DEPEND="
	dev-java/xerces:2
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
