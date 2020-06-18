# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/truffle-nfi-20.1.0.pom --download-uri https://repo.maven.apache.org/maven2/org/graalvm/truffle/truffle-nfi/20.1.0/truffle-nfi-20.1.0-sources.jar --slot 0 --keywords "~amd64" --ebuild truffle-nfi-20.1.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Native function interface for the Truffle framework."
HOMEPAGE="http://openjdk.java.net/projects/graal"
SRC_URI="https://repo.maven.apache.org/maven2/org/graalvm/truffle/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.graalvm.truffle:truffle-nfi:20.1.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.graalvm.truffle:truffle-api:20.1.0 -> dev-java/truffle-api

CDEPEND="
	dev-libs/libtruffle
	dev-java/truffle-api
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

JAVA_GENTOO_CLASSPATH="truffle-api"
