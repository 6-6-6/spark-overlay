# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/dependency-check-utils-4.0.2.pom --download-uri https://repo1.maven.org/maven2/org/owasp/dependency-check-utils/4.0.2/dependency-check-utils-4.0.2-sources.jar --slot 0 --keywords "~amd64" --ebuild dependency-check-utils-4.0.2-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.owasp:dependency-check-utils:4.0.2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Utilities used within dependency-check that might be useful in other projects"
HOMEPAGE="https://github.com/jeremylong/DependencyCheck.git/dependency-check-utils"
SRC_URI="
	https://repo1.maven.org/maven2/org/owasp/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/owasp/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.gson:gson:2.8.5 -> >=dev-java/gson-2.8.7:2.6
# commons-io:commons-io:2.6 -> >=dev-java/commons-io-2.6:1
# org.apache.commons:commons-lang3:3.4 -> >=dev-java/commons-lang-3.12.0:3.6
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-1.7.28:0

CDEPEND="
	>=dev-java/commons-io-2.6:1
	>=dev-java/commons-lang-3.12.0:3.6
	>=dev-java/gson-2.8.7:2.6
	>=dev-java/slf4j-api-1.7.28:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.findbugs:annotations:3.0.1u2 -> >=dev-java/findbugs-annotations-3.0.12:3

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/findbugs-annotations-3.0.12:3
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="gson-2.6,commons-io-1,commons-lang-3.6,slf4j-api"
JAVA_CLASSPATH_EXTRA="findbugs-annotations-3"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
