# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/log4j-api-2.0.pom --download-uri https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-api/2.0/log4j-api-2.0-sources.jar --slot 0 --keywords "~amd64" --ebuild log4j-api-2.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.logging.log4j:log4j-api:2.0"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The Log4j API"
HOMEPAGE="http://logging.apache.org/log4j/2.x/log4j-api/"
SRC_URI="https://repo1.maven.org/maven2/org/apache/logging/log4j/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/logging/log4j/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.osgi:org.osgi.core:4.3.1 -> >=dev-java/osgi-core-api-5.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	>=dev-java/osgi-core-api-5.0.0:0
	)
	test? (
		amd64? (
			dev-util/japi-compliance-checker
			dev-util/pkgdiff
		)
	)"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="osgi-core-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_TESTING_FRAMEWORKS="pkgdiff"
