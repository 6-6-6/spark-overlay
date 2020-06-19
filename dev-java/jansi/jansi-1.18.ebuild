# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jansi-1.18.pom --download-uri https://repo.maven.apache.org/maven2/org/fusesource/jansi/jansi/1.18/jansi-1.18-sources.jar --slot 0 --keywords "~amd64" --ebuild jansi-1.18.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jansi is a java library for generating and interpreting ANSI escape sequences."
HOMEPAGE="http://fusesource.github.io/jansi/jansi"
SRC_URI="https://repo.maven.apache.org/maven2/org/fusesource/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.fusesource.jansi:jansi:1.18"

CDPEND="
	>=dev-java/jansi-native-1.8
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jansi-native"
