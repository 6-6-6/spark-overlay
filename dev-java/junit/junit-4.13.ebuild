# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/junit-4.13.pom --download-uri https://repo.maven.apache.org/maven2/junit/junit/4.13/junit-4.13-sources.jar --slot 0 --keywords "~amd64" --ebuild junit-4.13.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JUnit is a unit testing framework for Java, created by Erich Gamma and Kent Beck."
HOMEPAGE="http://junit.org"
SRC_URI="https://repo.maven.apache.org/maven2/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="4"
KEYWORDS="~amd64"
MAVEN_ID="junit:junit:4.13"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.hamcrest:hamcrest-core:1.3 -> >=dev-java/hamcrest-core-1.3:1.3

CDEPEND="
	>=dev-java/hamcrest-core-1.3:1.3
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_ENCODING="ISO-8859-1"

JAVA_GENTOO_CLASSPATH="hamcrest-core-1.3"
