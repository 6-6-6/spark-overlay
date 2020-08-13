# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-module-jaxb-annotations-2.8.3.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/fasterxml/jackson/module/jackson-module-jaxb-annotations/2.8.3/jackson-module-jaxb-annotations-2.8.3-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/fasterxml/jackson/module/jackson-module-jaxb-annotations/2.8.3/jackson-module-jaxb-annotations-2.8.3.jar --slot 0 --keywords "~amd64" --ebuild jackson-module-jaxb-annotations-2.8.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MAVEN_ID="com.fasterxml.jackson.module:jackson-module-jaxb-annotations:2.8.3"
DESCRIPTION="Support for using JAXB annotations as an alternative to \"native\" Jackson annotations, for configuring data binding."
HOMEPAGE="http://github.com/FasterXML/jackson-module-jaxb-annotations"
SRC_URI="https://repo1.maven.org/maven2/com/fasterxml/jackson/module/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/fasterxml/jackson/module/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-annotations:2.8.0 -> >=dev-java/jackson-annotations-2.9.10:2
# com.fasterxml.jackson.core:jackson-core:2.8.3 -> >=dev-java/jackson-2.9.10:2
# com.fasterxml.jackson.core:jackson-databind:2.8.3 -> >=dev-java/jackson-databind-2.10.0:0

CDEPEND="
	>=dev-java/jackson-2.9.10:2
	>=dev-java/jackson-annotations-2.9.10:2
	>=dev-java/jackson-databind-2.10.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.xml.bind:jaxb-api:2.2 -> >=dev-java/jaxb-api-2.2:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/jaxb-api-2.2:0
	)
	test? (

		amd64? (
			dev-util/pkgdiff
			dev-util/japi-compliance-checker
		)
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-annotations-2,jackson-2,jackson-databind"
JAVA_CLASSPATH_EXTRA="jaxb-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TESTING_FRAMEWORKS="pkgdiff"
