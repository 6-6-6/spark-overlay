# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/dependency-check-utils-4.0.2.pom --download-uri https://repo.maven.apache.org/maven2/org/owasp/dependency-check-utils/4.0.2/dependency-check-utils-4.0.2-sources.jar --slot 0 --keywords "~amd64" --ebuild dependency-check-utils-4.0.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="dependency-check-utils is a collection of common utility classes used within dependency-check that might be useful in other projects."
HOMEPAGE="https://github.com/jeremylong/DependencyCheck.git/dependency-check-utils"
SRC_URI="https://repo.maven.apache.org/maven2/org/owasp/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.owasp:dependency-check-utils:4.0.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.gson:gson:2.8.5 -> >=dev-java/gson-2.8.5:0
# commons-io:commons-io:2.6 -> >=dev-java/commons-io-2.6:0
# org.apache.commons:commons-lang3:3.4 -> >=dev-java/commons-lang-3.10:3
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-1.7.28:0

CDEPEND="
	>=dev-java/commons-io-2.6:0
	>=dev-java/commons-lang-3.10:3
	>=dev-java/gson-2.8.5:0
	>=dev-java/slf4j-api-1.7.28:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.findbugs:annotations:3.0.1u2 -> >=dev-java/findbugs-annotation-3.0.12:3

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=dev-java/findbugs-annotation-3.0.12:3
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="gson,commons-io,commons-lang-3,slf4j-api"
JAVA_CLASSPATH_EXTRA="findbugs-annotation-3"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
