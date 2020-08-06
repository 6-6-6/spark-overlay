# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jdeparser-2.0.2.Final.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/jboss/jdeparser/jdeparser/2.0.2.Final/jdeparser-2.0.2.Final-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/jboss/jdeparser/jdeparser/2.0.2.Final/jdeparser-2.0.2.Final.jar --slot 0 --keywords "~amd64" --ebuild jdeparser-2.0.2-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jboss.jdeparser:jdeparser:2.0.2.Final"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Parent POM for JBoss projects. Provides default project build configuration."
HOMEPAGE="http://www.jboss.org/jdeparser"
SRC_URI="https://repo1.maven.org/maven2/org/jboss/${PN}/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/${PN}/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar"
LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
	test? (

		amd64? (
			dev-util/pkgdiff
			dev-util/japi-compliance-checker
		)
	)
"

RDEPEND="
	>=virtual/jre-1.7:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TESTING_FRAMEWORKS="pkgdiff"
