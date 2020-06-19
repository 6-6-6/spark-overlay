# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/testng-7.1.0.pom --download-uri https://repo.maven.apache.org/maven2/org/testng/testng/7.1.0/testng-7.1.0-sources.jar --slot 0 --keywords "~amd64" --ebuild testng-7.1.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Testing framework for Java"
HOMEPAGE="https://testng.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.testng:testng:7.1.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.beust:jcommander:1.72 -> >=dev-java/jcommander-1.78:0
# com.google.inject:guice:4.1.0 -> >=dev-java/guice-4.1:4
# org.yaml:snakeyaml:1.21 -> >=dev-java/snakeyaml-1.26:0

CDEPEND="
	>=dev-java/guice-4.1:4
	>=dev-java/jcommander-1.78:0
	>=dev-java/snakeyaml-1.26:0
	dev-java/junit:4
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

src_prepare() {
	default

	rm ${S}/Version.java || die
}

JAVA_GENTOO_CLASSPATH="jcommander,guice-4,snakeyaml,junit-4"
