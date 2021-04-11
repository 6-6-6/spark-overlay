# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jaxb-api-2.2.7.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/javax/xml/bind/jaxb-api/2.2.7/jaxb-api-2.2.7-sources.jar --binjar-uri https://repo1.maven.org/maven2/javax/xml/bind/jaxb-api/2.2.7/jaxb-api-2.2.7.jar --slot 0 --keywords "~amd64" --ebuild jaxb-api-2.2.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="javax.xml.bind:jaxb-api:2.2.7"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JAXB (JSR 222) API"
HOMEPAGE="http://jaxb.java.net/"
SRC_URI="https://repo1.maven.org/maven2/javax/xml/bind/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/javax/xml/bind/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="CDDL-1.1 GPL-2-with-classpath-exception"
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
