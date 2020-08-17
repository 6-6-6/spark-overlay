# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/persistence-api-1.0.pom --download-uri https://repo1.maven.org/maven2/javax/persistence/persistence-api/1.0/persistence-api-1.0-sources.jar --slot 0 --keywords "~amd64" --ebuild persistence-api-1.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="javax.persistence:persistence-api:1.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The Enterprise JavaBeans architecture is a component architecture for the development and deployment of component-based business applications. The purpose of Enterprise JavaBeans (EJB) 3.0 is to improve the EJB architecture by reducing its complexity from the developer's point of view."
HOMEPAGE="http://www.jcp.org/en/jsr/detail?id=220"
SRC_URI="https://repo1.maven.org/maven2/javax/persistence/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/javax/persistence/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
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
