# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jansi-1.13.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/fusesource/jansi/jansi/1.13/jansi-1.13-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/fusesource/jansi/jansi/1.13/jansi-1.13.jar --slot 0 --keywords "~amd64" --ebuild jansi-1.13.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MAVEN_ID="org.fusesource.jansi:jansi:1.13"
DESCRIPTION="Jansi is a java library for generating and interpreting ANSI escape sequences."
HOMEPAGE="http://jansi.fusesource.org/jansi"
SRC_URI="https://repo1.maven.org/maven2/org/fusesource/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/fusesource/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	test? (

		amd64? (
			dev-util/pkgdiff
			dev-util/japi-compliance-checker
		)
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TESTING_FRAMEWORKS="pkgdiff"
